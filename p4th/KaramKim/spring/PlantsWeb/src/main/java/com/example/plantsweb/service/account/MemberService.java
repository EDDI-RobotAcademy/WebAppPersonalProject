package com.example.plantsweb.service.account;

import com.example.plantsweb.service.account.request.MemberLoginRequest;
import com.example.plantsweb.service.account.request.MemberRegisterRequest;

public interface MemberService {

    public Boolean emailValidation(String email);
    public Boolean signUp(MemberRegisterRequest request);
    public String signIn(MemberLoginRequest request);
}
