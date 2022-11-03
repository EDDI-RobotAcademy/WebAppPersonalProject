package com.example.bucket_list_project.service.member;

import com.example.bucket_list_project.service.member.request.MemberSignInRequest;
import com.example.bucket_list_project.service.member.request.MemberSignUpRequest;

public interface MemberService {
    Boolean emailValidation(String email);

    Boolean signUp(MemberSignUpRequest signUpRequest);

    String signIn(MemberSignInRequest signInRequest);


    Boolean nicknameDoubleCheck(String nickName);
}
