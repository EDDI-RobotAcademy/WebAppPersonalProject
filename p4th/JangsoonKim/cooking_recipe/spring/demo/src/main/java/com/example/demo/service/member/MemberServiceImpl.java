package com.example.demo.service.member;

import com.example.demo.entity.board.Comment;
import com.example.demo.entity.board.Recipe;
import com.example.demo.entity.member.Authentication;
import com.example.demo.entity.member.BasicAuthentication;
import com.example.demo.entity.member.Member;
import com.example.demo.repository.member.AuthenticationRepository;
import com.example.demo.repository.member.MemberRepository;
import com.example.demo.repository.recipe.CommentRepository;
import com.example.demo.repository.recipe.RecipeRepository;
import com.example.demo.security.RedisService;
import com.example.demo.service.member.request.MemberNicknameModifyRequest;
import com.example.demo.service.member.request.MemberRegisterRequest;
import com.example.demo.service.member.request.MemberSigninRequest;
import com.example.demo.service.recipe.RecipeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.*;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private AuthenticationRepository authenticationRepository;

    @Autowired
    private RedisService redisService;

    @Autowired
    private RecipeRepository recipeRepository;

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private RecipeService service;


    @Override
    public Boolean emailValidation(String email) {
        Optional<Member> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            return false;
        }

        return true;
    }

    @Override
    public Boolean nicknameValidation(String nickname) {
        Optional<Member> maybeMember = memberRepository.findByNickname(nickname);

        if (maybeMember.isPresent()) {
            return false;
        }

        return true;
    }

    @Override
    public Boolean signUp(MemberRegisterRequest request) {
        final Member member = request.toMember();
        memberRepository.save(member);

        final BasicAuthentication auth = new BasicAuthentication(member,
                Authentication.BASIC_AUTH, request.getPassword());

        authenticationRepository.save(auth);

        return true;
    }

    @Override
    public Map<String, String> signIn(MemberSigninRequest request) {
        String email = request.getEmail();
        Optional<Member> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            Member member = maybeMember.get();

            log.info("member email: " + member.getEmail());
            log.info("request email: " + request.getEmail());

            if (!member.isRightPassword(request.getPassword())) {
                throw new RuntimeException("잘못된 패스워드입니다.");
            }

            UUID userToken = UUID.randomUUID();

            redisService.deleteByKey(userToken.toString());
            redisService.setKeyAndValue(userToken.toString(), member.getId());
            Map<String, String> userData = new HashMap<>();
            userData.put("userToken", userToken.toString());
            userData.put("memberEmail", member.getEmail());
            userData.put("memberNickname", member.getNickname());

            return userData;
        }

        throw new RuntimeException("가입된 사용자가 아닙니다.");
    }

    @Override
    public Boolean modifyNickname(MemberNicknameModifyRequest request) {
        String email = request.getEmail();
        Optional<Member> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            final String exNickname = maybeMember.get().getNickname();
            final Member member = request.toMember();
            member.setId(maybeMember.get().getId());

            memberRepository.save(member);

            List<Recipe> recipeList = recipeRepository.findAllRecipesByNickname(exNickname);
            if(recipeList.size()>0){
                for (int i = 0; i < recipeList.size(); i++) {
                    recipeList.get(i).setWriter(request.getNickname());

                }
                recipeRepository.saveAll(recipeList);
            }

            List<Comment> commentList = commentRepository.findAllCommentsByNickname(exNickname);
            if (commentList.size() > 0){
                for (int i = 0; i < commentList.size(); i++) {
                    commentList.get(i).setWriter(request.getNickname());
                }
                commentRepository.saveAll(commentList);
            }
        }
        return true;
    }

    @Override
    public Boolean modifyPassword(@RequestBody MemberRegisterRequest request) {
        String email = request.getEmail();
        Optional<Member> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            final Member member = request.toMember();
            member.setId(maybeMember.get().getId());
            Long memberId = maybeMember.get().getId();

            final Optional<Authentication> maybeAuth = authenticationRepository.findByMemberId(memberId);
            if (maybeAuth.isPresent()) {
                maybeAuth.get().getId();
                authenticationRepository.deleteById(maybeAuth.get().getId());

                final BasicAuthentication auth = new BasicAuthentication(member,
                        Authentication.BASIC_AUTH, request.getPassword());

                authenticationRepository.save(auth);
            }
        }
        return true;
    }

    @Override
    public Boolean removeAccount(String email) {
        Optional<Member> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            Long memberId = maybeMember.get().getId();

            final Optional<Authentication> maybeAuth = authenticationRepository.findByMemberId(memberId);
            if (maybeAuth.isPresent()) {
                maybeAuth.get().getId();
                authenticationRepository.deleteById(maybeAuth.get().getId());
                memberRepository.deleteById(memberId);
            }
            List<Recipe> recipeList = recipeRepository.findAllRecipesByNickname(maybeMember.get().getNickname());
            for(Recipe recipe: recipeList){
                service.remove(recipe.getRecipeNo());
            }

        }
        return true;
    }
}