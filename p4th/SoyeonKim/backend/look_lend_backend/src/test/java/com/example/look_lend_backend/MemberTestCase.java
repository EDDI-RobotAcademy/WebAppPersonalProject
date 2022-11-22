package com.example.look_lend_backend;

import com.example.look_lend_backend.entity.board.LendBoard;
import com.example.look_lend_backend.entity.member.Member;
import com.example.look_lend_backend.repository.board.LendBoardRepository;
import com.example.look_lend_backend.service.member.MemberService;
import com.example.look_lend_backend.service.member.request.MemberLoginRequest;
import com.example.look_lend_backend.service.member.request.MemberRegisterRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class MemberTestCase {

    @Autowired
    private MemberService service;

    @Test
    void memberSignUpTest() {
        MemberRegisterRequest registerRequest = new MemberRegisterRequest("test@naver.com", "test1","홍길동","땡떙이","부천시","몰라로","555동555호","00000");
        service.signUp(registerRequest);
    }

    @Test
    void memberSignInTest() {
        MemberLoginRequest loginRequest = new MemberLoginRequest("test@naver.com", "test1");
        service.signIn(loginRequest);
    }

    @Test
    void emailValidationTest() {
        boolean emailCheck = service.emailValidation("test@naver.com");
        System.out.println("이메일 중복 체크: " + emailCheck);
    }

    @Test
    void nicknameValidationTest() {
        boolean nicknameCheck = service.nickNameValidation("김떙땡");
        System.out.println("닉네임 중복 체크: " + nicknameCheck);
    }



}
