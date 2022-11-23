package com.example.backend.service.member;

import com.example.backend.entity.board.Board;
import com.example.backend.entity.member.Authentication;
import com.example.backend.entity.member.BasicAuthentication;
import com.example.backend.entity.member.Member;
import com.example.backend.repository.AuthenticationRepository;
import com.example.backend.repository.BoardRepository;
import com.example.backend.repository.MemberRepository;
import com.example.backend.service.member.request.FlutterUserTokenRequest;
import com.example.backend.service.member.request.MemberModifyRequest;
import com.example.backend.service.member.request.MemberRegisterRequest;
import com.example.backend.service.member.request.MemberSignInRequest;
import com.example.backend.service.member.response.MemberDataResponse;
import com.example.backend.service.security.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
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

    @Autowired
    private BoardRepository boardRepository;

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
    public String signIn(MemberSignInRequest request) {
        final String NO_EMAIL = "1";
        final String PASSWORD_MISS = "2";

        String email = request.getEmail();
        Optional<Member> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            Member member = maybeMember.get();

            log.info("member email: " + member.getEmail());
            log.info("request email: " + request.getEmail());
            log.info("request password: " + request.getPassword());

            if (!member.isRightPassword(request.getPassword())) {
                log.info("패스워드 오류");
                return PASSWORD_MISS;
                // throw new RuntimeException("잘못된 패스워드 입니다.");
            }

            UUID userToken = UUID.randomUUID();

            redisService.deleteByKey(userToken.toString());
            redisService.setKeyAndValue(userToken.toString(), member.getId());

            return userToken.toString();
        }
        log.info("가입된 사용자 아님");
        return NO_EMAIL;
        // throw new RuntimeException("가입된 사용자가 아닙니다.");
    }

    @Override
    public Boolean signOut(FlutterUserTokenRequest request) {
        String requestToken = request.getUserToken();
        redisService.deleteByKey(requestToken);
        return true;
    }

    @Override
    public MemberDataResponse userData(FlutterUserTokenRequest request) {
        log.info("userToken: " + request.getUserToken());
        Long memberId = redisService.getValueByKey(request.getUserToken());

        log.info(memberId.toString());

        if(memberId != null) {
            Optional<Member> maybeMember = memberRepository.findById(memberId);
            if(maybeMember.isPresent()) {
                MemberDataResponse dataRes = new MemberDataResponse(maybeMember.get().getEmail(), maybeMember.get().getNickname());
                return dataRes;
            }
        }
        throw new RuntimeException("로그인 중인 사용자를 찾을 수 없음!");
    }

    @Override
    public Boolean modifyUserData(MemberModifyRequest request) {
        Long memberId = redisService.getValueByKey(request.getUserToken());

        if (memberId != null) {
            Optional<Member> maybeMember = memberRepository.findById(memberId);
            if (maybeMember.isPresent()) {
                Member member = maybeMember.get();
                member.setNickname(request.getModifyNickname());
                memberRepository.save(member);

                return true;
            }
        }
        throw new RuntimeException("로그인 중인 사용자를 찾을 수 없음!");
    }

    @Override
    public Boolean removeMember(FlutterUserTokenRequest request) {
        Long memberId = redisService.getValueByKey(request.getUserToken());
        if(memberId != null) {

            final Optional<Authentication> maybeAuth = authenticationRepository.findByMemberId(memberId);
            if (maybeAuth.isPresent()) {
                maybeAuth.get().getId();
                authenticationRepository.deleteById(maybeAuth.get().getId());
            }

            List<Board> boards = new ArrayList<>();
            boards = boardRepository.findAllBoardsByMemberId(memberId, Sort.by(Sort.Direction.DESC, "boardNo"));

            for(Board b: boards) {
                boardRepository.deleteById(b.getBoardNo());
            }
            memberRepository.deleteById(memberId);
            return true;
        }
        throw new RuntimeException("로그인 중인 사용자를 찾을 수 없음!");
    }
}
