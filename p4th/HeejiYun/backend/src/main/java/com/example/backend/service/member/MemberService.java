package com.example.backend.service.member;

import com.example.backend.service.member.request.FlutterUserTokenRequest;
import com.example.backend.service.member.request.MemberModifyRequest;
import com.example.backend.service.member.request.MemberRegisterRequest;
import com.example.backend.service.member.request.MemberSignInRequest;
import com.example.backend.service.member.response.MemberDataResponse;
import org.springframework.web.bind.annotation.RequestBody;

public interface MemberService {

    Boolean signUp(MemberRegisterRequest request);
    Boolean emailValidation(String email);
    Boolean nicknameValidation(String nickname);
    String signIn(MemberSignInRequest request);

    Boolean signOut(FlutterUserTokenRequest request);

    MemberDataResponse userData(FlutterUserTokenRequest request);

    Boolean modifyUserData(MemberModifyRequest request);

    Boolean removeMember(FlutterUserTokenRequest request);

}
