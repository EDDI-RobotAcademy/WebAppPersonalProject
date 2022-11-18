package com.example.demo.service.member;

import com.example.demo.service.member.request.MemberNicknameModifyRequest;
import com.example.demo.service.member.request.MemberRegisterRequest;
import com.example.demo.service.member.request.MemberSigninRequest;

import java.util.Map;

public interface MemberService {

    Boolean signUp(MemberRegisterRequest request);
    Boolean emailValidation(String email);
    Boolean nicknameValidation(String nickname);
    Map<String, String> signIn(MemberSigninRequest request);
    public Boolean modifyNickname(MemberNicknameModifyRequest request);
    public Boolean modifyPassword(MemberRegisterRequest request);
    public Boolean removeAccount(String email);
}