package com.example.bucket_list_project.service.member;

import com.example.bucket_list_project.entity.member.MemberInfo;
import com.example.bucket_list_project.repository.member.MemberRepository;
import com.example.bucket_list_project.service.member.request.MemberSignUpRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

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

    @Test
    public void memberEmailDuplicateCheck(){
        String email = "sss@naver.com";

        boolean duplicateCheck = service.emailValidation(email);
        System.out.println(duplicateCheck);
    }
}
