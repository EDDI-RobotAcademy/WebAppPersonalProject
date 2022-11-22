package com.example.look_lend_backend.service.member;

import com.example.look_lend_backend.entity.member.Authentication;
import com.example.look_lend_backend.entity.member.BasicAuthentication;
import com.example.look_lend_backend.entity.member.Member;
import com.example.look_lend_backend.repository.member.AuthenticationRepository;
import com.example.look_lend_backend.repository.member.MemberRepository;
import com.example.look_lend_backend.service.member.request.MemberLoginRequest;
import com.example.look_lend_backend.service.member.request.MemberRegisterRequest;
import com.example.look_lend_backend.service.security.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService{

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private AuthenticationRepository authenticationRepository;

    @Autowired
    private RedisService redisService;


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
    public Boolean emailValidation(String email) {
        Optional<Member> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            return false;
        }
        return true;
    }

    @Override
    public Boolean nickNameValidation(String nickname) {
        Optional<Member> maybeMember = memberRepository.findByNickname(nickname);

        if (maybeMember.isPresent()) {
            return false;
        }
        return true;
    }

    @Override
    public String signIn(MemberLoginRequest request) {
        String email = request.getEmail();
        Optional<Member> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            Member member = maybeMember.get();
/*
            log.info("member email: " + member.getEmail());
            log.info("request email: " + request.getEmail());
            log.info("request password: " + request.getPassword());*/

            if (!member.isRightPassword(request.getPassword())) {
                throw new RuntimeException("패스워드가 잘못되었습니다!");
            }

            UUID userToken = UUID.randomUUID();

            redisService.deleteByKey(userToken.toString());
            redisService.setKeyAndValue(userToken.toString(), member.getId());

            return userToken.toString();
        }

        throw new RuntimeException("가입된 사용자가 아닙니다!");
    }

    @Override
    public List<Member> loginUserInfo(String loginUserToken) {
        String userToken = loginUserToken.substring(3, 39);

        log.info("로그인 유저토큰 : " + loginUserToken);
        log.info("로그인 유저토큰 추출 : " + userToken);

        Long loginUserId = redisService.getValueMyKey(userToken);
        log.info("로그인 유저아이디 번호: " + redisService.getValueMyKey(userToken));

        Optional<Member> maybeMember = memberRepository.findById(loginUserId);
        List<Member> member = new ArrayList<>();
        member.add(maybeMember.get());

        log.info("로그인 멤버 정보: " + member.toString());
        return member;
    }

    @Override
    public String loginUserNickname(String replacedUserValue) {

        Long loginUserId = redisService.getValueMyKey(replacedUserValue);

        Optional<Member> maybeMemeberId = memberRepository.findById(loginUserId);

        if (maybeMemeberId.isPresent()) {
            Member memberNickname = maybeMemeberId.get();
            return memberNickname.getNickname();
        }

        return null;
    }
}

