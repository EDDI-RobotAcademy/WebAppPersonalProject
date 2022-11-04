package com.example.plantsweb.service.account;

import com.example.plantsweb.service.account.request.MemberLoginRequest;
import com.example.plantsweb.service.account.request.MemberRegisterRequest;

public interface MemberService {

    Boolean emailValidation(String email);
    Boolean signUp(MemberRegisterRequest request);
    String signIn(MemberLoginRequest request);
}
