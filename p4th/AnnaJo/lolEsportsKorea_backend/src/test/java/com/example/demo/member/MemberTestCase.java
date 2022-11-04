package com.example.demo.member;

import com.example.demo.service.member.MemberService;
import com.example.demo.service.member.request.MemberRegisterRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

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
}
