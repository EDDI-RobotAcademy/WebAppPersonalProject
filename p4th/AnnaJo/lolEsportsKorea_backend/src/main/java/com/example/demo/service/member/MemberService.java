package com.example.demo.service.member;

import com.example.demo.service.member.request.MemberLoginRequest;
import com.example.demo.service.member.request.MemberRegisterRequest;

public interface MemberService {
    Boolean emailValidation(String email);
    Boolean nicknameValidation(String nickname);
    Boolean signUp(MemberRegisterRequest request);
    String signIn(MemberLoginRequest request);
}
