package kr.eddi.LeaningHelper.service.member;

import kr.eddi.LeaningHelper.request.member.MemberSignUpRequest;
import kr.eddi.LeaningHelper.request.member.MemberSignInRequest;

public interface MemberService {
    public Boolean memberSignUp(MemberSignUpRequest memberSignUpRequest);

    public Boolean emailValidation(String email);

    public Boolean nickNameValidation(String nickName);

    public String signIn(MemberSignInRequest memberSignInRequest);

}
