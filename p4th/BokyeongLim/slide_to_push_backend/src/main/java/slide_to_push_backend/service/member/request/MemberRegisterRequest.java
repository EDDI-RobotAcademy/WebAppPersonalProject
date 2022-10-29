package slide_to_push_backend.service.member.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import slide_to_push_backend.entity.member.Account;
import slide_to_push_backend.entity.member.AccountProfile;

@Getter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class MemberRegisterRequest {
    String nickName;
    String email;
    String password;

    public Account toMember () {
        AccountProfile profile = new AccountProfile(nickName);
        return new Account(email, profile);
    }
}
