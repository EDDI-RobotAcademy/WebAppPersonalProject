package personal_project.look_style.service.member;

import personal_project.look_style.service.member.request.MemberSignInRequest;
import personal_project.look_style.service.member.request.MemberSignUpRequest;

import java.util.Map;

public interface MemberService {

    Boolean signUp(MemberSignUpRequest request);
    Boolean emailValidation(String email);
    Boolean nicknameValidation(String nickname);
    String signIn(MemberSignInRequest request);
    Map<String, String> sendUserInfo(MemberSignInRequest request);
}
