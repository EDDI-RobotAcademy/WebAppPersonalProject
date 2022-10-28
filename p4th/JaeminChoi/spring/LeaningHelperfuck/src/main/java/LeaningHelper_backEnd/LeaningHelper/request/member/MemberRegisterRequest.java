package LeaningHelper_backEnd.LeaningHelper.request.member;

import LeaningHelper_backEnd.LeaningHelper.entity.Member.Member;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Data
@ToString
@RequiredArgsConstructor
public class MemberRegisterRequest {
    private final String id;
    private final String pw;
    private final String nickName;
    private final String auth;



    public Member toMember () {
        return new Member(
                id,
                pw,
                nickName
        );
    }

}
