package kr.eddi.demo.service.request;


import kr.eddi.demo.entity.MemberProfile;
import kr.eddi.demo.entity.ReadUsMember;
import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@ToString
@RequiredArgsConstructor
@Slf4j
public class MemberRegisterRequest {

    private final String email;
    private final String password;
    private final String nickname;
    private final String biography;



    public ReadUsMember toMember() {

        MemberProfile profile = new MemberProfile();

        if (nickname == null || nickname.length() == 0) {

            log.info("nickname is null or length is 0");

            return new ReadUsMember(
                    this.email,
                    profile.builder()
                            .nickName(this.email)
                            .biography(this.biography)
                            .build()
                    );
        }


        log.info("nickname isn't empty");

        return new ReadUsMember(
                this.email,
                profile.builder()
                        .nickName(this.nickname)
                        .biography(this.biography)
                        .build());
    }
}
