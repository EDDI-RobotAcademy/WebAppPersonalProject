package personal_project.look_style.service.member.request;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import personal_project.look_style.entity.Member;

@Getter
@ToString
@RequiredArgsConstructor
public class MemberSignUpRequest {

    private final String email;
    private final String password;
    private final String nickname;

    public Member toMember () {
        return new Member(email, nickname);
    }
}
