package slide_to_push_backend.controller.member.form;

import lombok.Data;
import slide_to_push_backend.service.member.request.MemberSignInRequest;

@Data
public class MemberSignInForm {
    String email;
    String password;

    public MemberSignInRequest toMemberSignInRequest () {
        return new MemberSignInRequest(email, password);
    }
}
