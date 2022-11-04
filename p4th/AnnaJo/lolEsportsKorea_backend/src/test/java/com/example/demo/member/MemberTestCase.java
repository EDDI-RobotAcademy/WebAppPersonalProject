package com.example.demo.member;

import com.example.demo.controller.member.request.MemberLoginForm;
import com.example.demo.service.member.MemberService;
import com.example.demo.service.member.request.MemberLoginRequest;
import com.example.demo.service.member.request.MemberRegisterRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.bind.annotation.RequestBody;

@SpringBootTest
public class MemberTestCase {

    @Autowired
    private MemberService service;

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
        String result = service.signIn(memberLoginRequest);

        System.out.println("result : " + result);
    }
}
