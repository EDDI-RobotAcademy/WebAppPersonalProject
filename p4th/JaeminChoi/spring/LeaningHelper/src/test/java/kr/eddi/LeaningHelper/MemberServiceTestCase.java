package kr.eddi.LeaningHelper;

import kr.eddi.LeaningHelper.request.member.MemberSignInRequest;
import kr.eddi.LeaningHelper.service.member.MemberServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class MemberServiceTestCase {

    @Autowired
    private MemberServiceImpl service;

    @Test
    void checkId(){
        String ID = "Test@test.com";
        Integer outcome = service.emailValidation(ID);
        String ID2 = "test@test.com";
        Integer outcome2 = service.emailValidation(ID2);
        String ID3 = "test1@test.com";
        Integer outcome3 = service.emailValidation(ID3);

        System.out.println("결과 : " + outcome );
        System.out.println("결과 : " + outcome2 );
        System.out.println("결과 : " + outcome3 );
    }

    @Test
    void checkSignIn(){
        MemberSignInRequest memberSignInTestRequest = new MemberSignInRequest("Test@test.com" , "test123!");

        String outcome = service.signIn(memberSignInTestRequest);

        System.out.println("결과 : " + outcome );
    }
}
