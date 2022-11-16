package kr.eddi.LeaningHelper.request.member;


import kr.eddi.LeaningHelper.entity.member.Member;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Data
@ToString
@RequiredArgsConstructor
public class MemberSignInRequest {
    private final String email;
    private final String password;
}
