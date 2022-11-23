package com.example.demo.member;

import com.example.demo.controller.member.request.MemberLoginForm;
import com.example.demo.entity.Authentication.Authentication;
import com.example.demo.entity.member.Member;
import com.example.demo.repository.member.AuthenticationRepository;
import com.example.demo.repository.member.MemberProfileRepository;
import com.example.demo.repository.member.MemberRepository;
import com.example.demo.service.member.MemberService;
import com.example.demo.service.member.request.MemberLoginRequest;
import com.example.demo.service.member.request.MemberRegisterRequest;
import com.example.demo.service.security.RedisService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Optional;

@SpringBootTest
public class MemberTestCase {

    @Autowired
    private MemberService service;

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private MemberProfileRepository memberProfileRepository;

    @Autowired
    private AuthenticationRepository authenticationRepository;

    @Test
    void emailValidation() {

        boolean result = service.emailValidation("kun@gmail.com");
        System.out.println("result : " + result);

    }

    @Test
    void nicknameValidation() {

        boolean result = service.nicknameValidation("쿤");
        System.out.println("result : " + result);

    }

    @Test
    void signUp() {

        MemberRegisterRequest registerRequest = new MemberRegisterRequest("jokun@gmail.com", "1234", "조쿤");
        boolean result = service.signUp(registerRequest);

        System.out.println("result : " + result);
    }

    @Test
    void signIn() {

        MemberLoginRequest memberLoginRequest = new MemberLoginRequest("jokun@gmail.com", "1234");
        String result = String.valueOf(service.signIn(memberLoginRequest));

        System.out.println("result : " + result);
    }

    @Test
    void memberRemove() {
        Optional<Member> maybeMember = memberRepository.findByEmail("faker@gmail.com");
        if (maybeMember.isPresent()) {
            Long memberId = maybeMember.get().getId();
            System.out.println("memberId :" + memberId);

            final Optional<Authentication> maybeAuth = authenticationRepository.findByMemberId(memberId);
            if (maybeAuth.isPresent()) {
                Long authId = maybeAuth.get().getId();
                authenticationRepository.deleteById(authId);
                memberProfileRepository.deleteById(memberId);
                memberRepository.deleteById(memberId);
                System.out.println("계정 삭제 성공");
            }else{
                System.out.println("삭제중 에러");
            }
        }else {
            throw new RuntimeException("가입된 정보가 없습니다.");
        }
    }
}

