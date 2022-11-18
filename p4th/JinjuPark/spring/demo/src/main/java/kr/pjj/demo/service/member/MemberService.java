package kr.pjj.demo.service.member;


import kr.pjj.demo.entity.member.Member;
import kr.pjj.demo.service.member.request.MemberLoginRequest;
import kr.pjj.demo.service.member.request.MemberRegisterRequest;

import java.util.List;

public interface MemberService {
    Boolean signUp(MemberRegisterRequest request);
    Boolean emailValidation(String email);

    Boolean nickNameValidation(String nickname);
    String signIn(MemberLoginRequest request);
    List<Member> loginUserInfo(String loginUserToken);
}
