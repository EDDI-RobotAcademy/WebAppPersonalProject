package com.example.bucket_list_project.service.member.account;

import com.example.bucket_list_project.service.member.request.account.MemberSignInRequest;
import com.example.bucket_list_project.service.member.request.account.MemberSignUpRequest;

public interface MemberService {
    Boolean emailValidation(String email);

    Boolean signUp(MemberSignUpRequest signUpRequest);

    String signIn(MemberSignInRequest signInRequest);

    Boolean nicknameDoubleCheck(String nickName);

    String findCurrentUserNickName(String replacedUserValue);

}
