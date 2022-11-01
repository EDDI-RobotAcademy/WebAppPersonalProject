package kr.eddi.demo.controller.form;


import kr.eddi.demo.service.request.MemberLoginRequest;
import lombok.Data;

@Data
public class MemberLoginForm {

    private String email;
    private String password;

    public MemberLoginRequest toMemberLoginRequest() {
        return new MemberLoginRequest(email, password);
    }
}
