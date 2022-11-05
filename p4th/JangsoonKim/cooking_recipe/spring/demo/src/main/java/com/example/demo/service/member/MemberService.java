package com.example.demo.service.member;

import com.example.demo.service.member.request.MemberRegisterRequest;
import com.example.demo.service.member.request.MemberSigninRequest;

public interface MemberService {

    Boolean signUp(MemberRegisterRequest request);
    Boolean emailValidation(String email);
    Boolean nicknameValidation(String nickname);

    String signIn(MemberSigninRequest request);
}