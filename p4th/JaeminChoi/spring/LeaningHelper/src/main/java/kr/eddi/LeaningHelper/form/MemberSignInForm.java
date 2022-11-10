package kr.eddi.LeaningHelper.form;

import kr.eddi.LeaningHelper.request.member.MemberSignInRequest;
import lombok.Data;

@Data
public class MemberSignInForm {

    private String email;
    private String password;


    public MemberSignInRequest toMemberSignInRequest () {
        return new MemberSignInRequest(email , password);
    }
}
