package LeaningHelper_backEnd.LeaningHelper.service.member;

import LeaningHelper_backEnd.LeaningHelper.request.member.MemberRegisterRequest;
import org.springframework.stereotype.Service;

@Service
public interface MemberService {
    public void memberRegister(MemberRegisterRequest memberRegisterRequest);

    public Boolean emailValidation(String email);


}
