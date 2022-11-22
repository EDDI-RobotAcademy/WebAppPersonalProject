package kr.eddi.LeaningHelper.service.member;

import kr.eddi.LeaningHelper.request.member.MemberSignUpRequest;
import kr.eddi.LeaningHelper.request.member.MemberSignInRequest;

import java.util.Map;

public interface MemberService {
    public Boolean memberSignUp(MemberSignUpRequest memberSignUpRequest);

    public Integer emailValidation(String email);

    public Integer nickNameValidation(String nickName);

    public Map<String, String> signIn(MemberSignInRequest memberSignInRequest);


}
