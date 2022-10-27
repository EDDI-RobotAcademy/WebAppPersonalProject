package kr.eddi.demo;

import kr.eddi.demo.service.MemberServiceImpl;
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

}
