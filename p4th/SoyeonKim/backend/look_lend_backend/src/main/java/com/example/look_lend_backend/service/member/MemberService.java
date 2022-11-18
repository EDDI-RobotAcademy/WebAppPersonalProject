package com.example.look_lend_backend.service.member;

import com.example.look_lend_backend.service.member.request.MemberLoginRequest;
import com.example.look_lend_backend.service.member.request.MemberRegisterRequest;

public interface MemberService {
    Boolean signUp(MemberRegisterRequest request);
    Boolean emailValidation(String email);
    Boolean nickNameValidation(String nickname);
    String signIn(MemberLoginRequest request);
}
