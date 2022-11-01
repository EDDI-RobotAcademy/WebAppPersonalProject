package slide_to_push_backend.service.member.request;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import slide_to_push_backend.entity.member.Account;
import slide_to_push_backend.entity.member.AccountProfile;

@Getter
@ToString
@RequiredArgsConstructor
public class MemberRegisterRequest {
    private final String nickName;
    private final String email;
    private final String password;

    public Account toMember () {
        AccountProfile profile = new AccountProfile(nickName);
        return new Account(email, profile);
    }
}
