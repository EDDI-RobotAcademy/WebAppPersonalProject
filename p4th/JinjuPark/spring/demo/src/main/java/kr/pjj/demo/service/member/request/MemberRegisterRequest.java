package kr.pjj.demo.service.member.request;


import kr.pjj.demo.entity.member.Member;
import kr.pjj.demo.entity.member.MemberProfile;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public class MemberRegisterRequest {

    private final String email;
    private final String password;

    private final String username;
    private final String nickname;
    private final String city;
    private final String street;
    private final String addressDetail;
    private final String zipcode;

    public Member toMember () {
        return new Member(
                email,
                username,
                nickname,
                MemberProfile.of(city, street, addressDetail, zipcode)
        );
    }
}
