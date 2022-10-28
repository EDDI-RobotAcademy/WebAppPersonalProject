package com.example.bucket_list_project.service.member;

import com.example.bucket_list_project.service.member.request.MemberSignUpRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class MemberTestCase {

    @Autowired
    private MemberServiceImpl service;

    @Test
    public void memberSignUpTest() {
        MemberSignUpRequest request = new MemberSignUpRequest("sss@naver.com", "123415", "nickname");
        boolean checkSignUp = service.signUp(request);

        System.out.println(checkSignUp);
    }
}
