package kr.eddi.LeaningHelper.service.member;

import kr.eddi.LeaningHelper.request.member.MemberRegisterRequest;
import kr.eddi.LeaningHelper.request.member.MemberSignInRequest;
import org.springframework.stereotype.Service;

public interface MemberService {
    public Boolean memberRegister(MemberRegisterRequest memberRegisterRequest);

    public Boolean emailValidation(String id);

    public String signIn(MemberSignInRequest memberSignInRequest);

}
