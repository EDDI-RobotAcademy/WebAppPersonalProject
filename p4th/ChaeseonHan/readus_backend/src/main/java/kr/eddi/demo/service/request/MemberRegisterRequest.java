package kr.eddi.demo.service.request;


import kr.eddi.demo.entity.ReadUsMember;
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
    private final String nicKName;
    private final String biography;



    public ReadUsMember toMember() {

        if (nicKName == null || nicKName.length() == 0) {

            log.info("nickname is null or length is 0");

            return new ReadUsMember(
                    this.email,
                    this.email,
                    this.biography
            );
        }


        log.info("nickname isn't empty");

        return new ReadUsMember(
                this.email,
                this.nicKName,
                this.biography
        );
    }
}
