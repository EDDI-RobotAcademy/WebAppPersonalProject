package kr.eddi.LeaningHelper.form;

import kr.eddi.LeaningHelper.request.member.MemberRegisterRequest;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemberRegisterForm {

    private String id;
    private String pw;
    private String nickName;

    public MemberRegisterRequest toMemberRegisterRequest () {
        return new MemberRegisterRequest(id , pw , nickName);
    }
}
