package kr.eddi.LeaningHelper.service.member;

import kr.eddi.LeaningHelper.request.member.MemberRegisterRequest;
import org.springframework.stereotype.Service;

@Service
public interface MemberService {
    public Boolean memberRegister(MemberRegisterRequest memberRegisterRequest);

    public Boolean emailValidation(String id);


}
