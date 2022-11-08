package com.example.demo.service.member;

import com.example.demo.service.member.request.MemberRegisterRequest;

public interface MemberService {
    Boolean emailValidation(String email);
    Boolean signUp(MemberRegisterRequest request);
}
