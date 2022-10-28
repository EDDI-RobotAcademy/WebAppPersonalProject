package kr.eddi.demo.controller.form;


import kr.eddi.demo.service.request.MemberRegisterRequest;
import lombok.*;

@Data
public class MemberRegisterForm {

    private String email;
    private String password;
    private String nickname;
    private String biography;

    public MemberRegisterRequest toMemberRegisterRequest() {
        return new MemberRegisterRequest(email, password, nickname, biography);
    }
}
