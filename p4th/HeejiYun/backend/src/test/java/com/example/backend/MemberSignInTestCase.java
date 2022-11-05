package com.example.backend;

import com.example.backend.service.member.MemberService;
import com.example.backend.service.member.request.MemberSignInRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class MemberSignInTestCase {
    @Autowired
    private MemberService service;

    @Test
    void memberSignInTest() {
        MemberSignInRequest memberSignInRequest = new MemberSignInRequest("test5@gmail.com", "test5");

        System.out.println("signInResult: " + service.signIn(memberSignInRequest));
    }
}
