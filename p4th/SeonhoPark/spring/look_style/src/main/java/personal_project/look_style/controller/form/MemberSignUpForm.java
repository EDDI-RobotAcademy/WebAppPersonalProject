package personal_project.look_style.controller.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import personal_project.look_style.service.member.request.MemberSignUpRequest;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemberSignUpForm {

    private String email;
    private String password;
    private String nickname;

    public MemberSignUpRequest toMemberSignUpRequest() {
        return new MemberSignUpRequest(email, password, nickname);
    }
}
