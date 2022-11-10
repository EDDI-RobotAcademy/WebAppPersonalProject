package kr.eddi.LeaningHelper.form;

import kr.eddi.LeaningHelper.request.member.MemberSignUpRequest;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemberSignUpForm {

    private String email;
    private String password;
    private String nickName;

    public MemberSignUpRequest toMemberRegisterRequest () {
        return new MemberSignUpRequest(email , password , nickName);
    }
}
