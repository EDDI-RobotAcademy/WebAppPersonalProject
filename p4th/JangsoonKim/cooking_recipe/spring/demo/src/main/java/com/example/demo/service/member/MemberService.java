package com.example.demo.service.member;

import com.example.demo.service.member.request.MemberRegisterRequest;
import com.example.demo.service.member.request.MemberSigninRequest;

import java.util.Map;

public interface MemberService {

    Boolean signUp(MemberRegisterRequest request);
    Boolean emailValidation(String email);
    Boolean nicknameValidation(String nickname);

    Map<String, String> signIn(MemberSigninRequest request);

}