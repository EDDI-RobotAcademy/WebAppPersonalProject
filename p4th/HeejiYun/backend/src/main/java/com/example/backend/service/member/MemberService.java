package com.example.backend.service.member;

import com.example.backend.service.member.request.MemberRegisterRequest;
import com.example.backend.service.member.request.MemberSignInRequest;

public interface MemberService {

    Boolean signUp(MemberRegisterRequest request);
    Boolean emailValidation(String email);
    Boolean nicknameValidation(String nickname);

    String signIn(MemberSignInRequest request);

}
