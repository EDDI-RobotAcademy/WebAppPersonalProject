package kr.pjj.demo;

import kr.pjj.demo.service.member.MemberService;
import kr.pjj.demo.service.member.request.MemberLoginRequest;
import kr.pjj.demo.service.member.request.MemberRegisterRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class MemberTestCase {

    @Autowired
    private MemberService service;

    //MemberServiceImpl의 메소드와 받아야하는 파라미터만 입력해주면 테스트 가능

    @Test
    void memberSignUpTest() {
        MemberRegisterRequest registerRequest = new MemberRegisterRequest("hehe@gmail.com", "hehe", "김헤헤", "웃는헤헤씨","서울시", "마포구", "102", "12305");
        service.signUp(registerRequest);
    }

    @Test
    void memberSignInTest() {
        MemberLoginRequest loginRequest = new MemberLoginRequest("hehe@gmail.com", "hehe");
        service.signIn(loginRequest);

    }

    @Test
    void emailValidationTest(){
        boolean emailCheck = service.emailValidation("hehe@gmail.com");
        System.out.println("이메일 중복 체크: " + emailCheck);
    }

    @Test
    void nicknameValidationTest(){
        boolean nicknameCheck = service.nickNameValidation("웃는헤헤씨");
        System.out.println("닉네임 중복 체크: " + nicknameCheck);
    }

}





