package kr.eddi.demo;

import kr.eddi.demo.service.MemberServiceImpl;
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

}
