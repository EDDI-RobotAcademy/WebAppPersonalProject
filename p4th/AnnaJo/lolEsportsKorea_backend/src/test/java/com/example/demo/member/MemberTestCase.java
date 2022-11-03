package com.example.demo.member;

import com.example.demo.controller.member.request.MemberRegisterForm;
import com.example.demo.service.member.MemberService;
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
    void signUp() {

        MemberRegisterRequest registerRequest = new MemberRegisterRequest("kun@gmail.com", "0426", "쿤");
        boolean result = service.signUp(registerRequest);

        System.out.println("result : " + result);
    }
}
