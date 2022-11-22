package com.example.backend;

import com.example.backend.service.member.MemberService;
import com.example.backend.service.member.request.FlutterUserTokenRequest;
import com.example.backend.service.member.request.MemberSignInRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class MemberDataTestCase {
    @Autowired
    private MemberService service;

    @Test
    void memberDataReadTest() {
        MemberSignInRequest memberSignInRequest = new MemberSignInRequest("test7@gmail.com", "test7777");
        String userToken = service.signIn(memberSignInRequest);

        FlutterUserTokenRequest dataReq = new FlutterUserTokenRequest(userToken);

        System.out.println("userDataResult: " + service.userData(dataReq));
    }
}
