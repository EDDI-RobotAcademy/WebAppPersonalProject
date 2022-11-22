package com.example.demo.service.member;

import com.example.demo.service.member.request.MemberLoginRequest;
import com.example.demo.service.member.request.MemberRegisterRequest;

import java.util.Map;

public interface MemberService {
    Boolean emailValidation(String email);
    Boolean nicknameValidation(String nickname);
    Boolean signUp(MemberRegisterRequest request);
    Map<String, String> signIn(MemberLoginRequest request);
    Boolean remove(String email);
}
