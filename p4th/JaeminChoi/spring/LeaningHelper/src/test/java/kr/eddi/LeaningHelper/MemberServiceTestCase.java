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
        boolean outcome = service.emailValidation(ID);

        System.out.println("결과 : " + outcome );
    }

    @Test
    void checkSignIn(){
        MemberSignInRequest memberSignInTestRequest = new MemberSignInRequest("Test@test.com" , "test123!");

        String outcome = service.signIn(memberSignInTestRequest);

        System.out.println("결과 : " + outcome );
    }
}
