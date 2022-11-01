package kr.eddi.LeaningHelper.form;

import kr.eddi.LeaningHelper.request.member.MemberSignInRequest;
import lombok.Data;

@Data
public class MemberSignInForm {

    private String id;
    private String pw;


    public MemberSignInRequest toMemberSignInRequest () {
        return new MemberSignInRequest(id , pw);
    }
}
