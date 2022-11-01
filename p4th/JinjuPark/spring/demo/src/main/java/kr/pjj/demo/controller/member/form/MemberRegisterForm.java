package kr.pjj.demo.controller.member.form;


import kr.pjj.demo.service.member.request.MemberRegisterRequest;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemberRegisterForm {

    private String email;
    private String password;
    private String username;
    private String nickname;
    private String city;
    private String street;
    private String addressDetail;
    private String zipcode;

    public MemberRegisterRequest toMemberRegisterRequest () {
        return new MemberRegisterRequest( email, password, username, nickname, city, street, addressDetail, zipcode);
    }
}
