package com.example.backend;

import com.example.backend.repository.AuthenticationRepository;
import com.example.backend.repository.MemberRepository;
import com.example.backend.service.member.MemberService;
import com.example.backend.service.member.request.MemberRegisterRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class MemberRegisterTestCase {

    @Autowired
    private MemberService memberService;

    @Test
    void emailValidationTest () {
        System.out.println("result :" + memberService.emailValidation("test@gmail.com"));
    }

    @Test
    void nicknameValidationTest () {
        System.out.println("result :" + memberService.nicknameValidation("철수"));
    }

    @Test
    void memberRegisterTest () {
        MemberRegisterRequest testMemberReq =
                new MemberRegisterRequest("test5@gmail.com", "test5", "정숙");

        System.out.println("register result: " + memberService.signUp(testMemberReq));
    }
}
