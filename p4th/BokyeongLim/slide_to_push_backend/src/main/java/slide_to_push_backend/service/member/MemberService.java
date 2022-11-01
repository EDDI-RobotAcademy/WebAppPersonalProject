package slide_to_push_backend.service.member;

import slide_to_push_backend.service.member.request.MemberRegisterRequest;
import slide_to_push_backend.service.member.request.MemberSignInRequest;

public interface MemberService {

    String signIn(MemberSignInRequest request);
    Boolean emailValidation(String email);
    Boolean signUp(MemberRegisterRequest registerRequest);

}

