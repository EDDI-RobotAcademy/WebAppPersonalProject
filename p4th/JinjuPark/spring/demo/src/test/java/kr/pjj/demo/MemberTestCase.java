package kr.pjj.demo;

import kr.pjj.demo.service.member.MemberService;
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
        MemberRegisterRequest registerRequest = new MemberRegisterRequest("wow@gmail.com", "wow1234", "wow", "와우굿","서울시", "강남구", "102", "10305");
        service.signUp(registerRequest);
    }

    @Test
    void emailValidationTest(){
        boolean emailCheck = service.emailValidation("kim@gmail.com");
        System.out.println("이메일 중복 체크: " + emailCheck);
    }

    @Test
    void nicknameValidationTest(){
        boolean nicknameCheck = service.nickNameValidation("와우굿");
        System.out.println("닉네임 중복 체크: " + nicknameCheck);
    }

}





