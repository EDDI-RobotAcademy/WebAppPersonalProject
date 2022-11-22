package com.example.look_lend_backend.service.member;

import com.example.look_lend_backend.entity.member.Member;
import com.example.look_lend_backend.service.member.request.MemberLoginRequest;
import com.example.look_lend_backend.service.member.request.MemberRegisterRequest;

import java.util.List;

public interface MemberService {
    Boolean signUp(MemberRegisterRequest request);
    Boolean emailValidation(String email);
    Boolean nickNameValidation(String nickname);
    String signIn(MemberLoginRequest request);
    List<Member> loginUserInfo(String loginUserToken);

    String loginUserNickname(String replacedUserValue);
}
