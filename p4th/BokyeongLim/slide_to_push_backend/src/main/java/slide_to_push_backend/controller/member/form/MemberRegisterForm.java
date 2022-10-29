package slide_to_push_backend.controller.member.form;

import lombok.*;
import slide_to_push_backend.service.member.request.MemberRegisterRequest;

@Getter
@Setter
@NoArgsConstructor
public class MemberRegisterForm {

    public MemberRegisterRequest toMemberRegisterRequest;
    String nickName;
    String email;
    String password;

    public MemberRegisterRequest toMemberRegisterRequest () {
        return new MemberRegisterRequest(nickName, email, password);
    }
}
