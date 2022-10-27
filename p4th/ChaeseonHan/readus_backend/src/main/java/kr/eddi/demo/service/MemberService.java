package kr.eddi.demo.service;

import kr.eddi.demo.service.request.MemberLoginRequest;
import kr.eddi.demo.service.request.MemberRegisterRequest;

public interface MemberService {
    Boolean signUp(MemberRegisterRequest request);
    Boolean emailValidation(String email);
    String signIn(MemberLoginRequest request);
}
