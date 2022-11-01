package com.example.backend.service.member;

import com.example.backend.service.member.request.MemberRegisterRequest;

public interface MemberService {

    Boolean signUp(MemberRegisterRequest request);
    Boolean emailValidation(String email);
    Boolean nicknameValidation(String nickname);

}
