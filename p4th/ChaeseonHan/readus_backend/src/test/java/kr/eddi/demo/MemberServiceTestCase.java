package kr.eddi.demo;

import kr.eddi.demo.entity.MemberProfile;
import kr.eddi.demo.service.MemberServiceImpl;
import kr.eddi.demo.service.request.MemberLoginRequest;
import kr.eddi.demo.service.request.MemberRegisterRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
public class MemberServiceTestCase {

    @Autowired
    private MemberServiceImpl service;

    @Test
    void checkEmail() {
        boolean answer = service.emailValidation("test@gmail.com");
        System.out.println("answer: " + answer);
    }

    @Test
    void signUpTestWithOutNickname() {
        MemberRegisterRequest request = new MemberRegisterRequest("test@gmail.com", "123456", "", "");
        Boolean isSuccess = service.signUp(request);
        System.out.println("isSuccess: " + isSuccess);
    }

    @Test
    void signInTest() {
        MemberLoginRequest request = new MemberLoginRequest("test@gmail.com", "123456");
        String userToken = service.signIn(request);
        System.out.println("userToken: " + userToken);
    }

    @Test
    void loginProfile() {
        String nickName = service.getSignInMemberNickName("c0c90caa-0477-4524-81a5-918414c10f26");
        System.out.println("nickname: " + nickName);
    }

}
