package kr.eddi.demo.entity.service.jpa.member;


import kr.eddi.demo.entity.service.jpa.member.request.MemberLoginRequest;
import kr.eddi.demo.entity.service.jpa.member.request.MemberRegisterRequest;

public interface JpaMemberService {
    Boolean signUp(MemberRegisterRequest request);
    Boolean emailValidation(String email);
    String signIn(MemberLoginRequest request);



}