package kr.eddi.demo.entity.service.member;



import kr.eddi.demo.entity.service.member.request.MemberLoginRequest;
import kr.eddi.demo.entity.service.member.request.MemberRegisterRequest;

public interface JpaMemberService {

    //void signUp(void);
    Boolean signUp(MemberRegisterRequest request);
    Boolean emailValidation(String email);
    String signIn(MemberLoginRequest request);


}
