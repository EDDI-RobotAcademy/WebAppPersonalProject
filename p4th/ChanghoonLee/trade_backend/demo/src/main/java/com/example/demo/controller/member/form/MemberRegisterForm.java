package com.example.demo.controller.member.form;

import com.example.demo.service.member.request.MemberRegisterRequest;
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
    private String city;
    private String street;
    private String addressDetail;
    private String zipcode;

    public MemberRegisterRequest toMemberRegisterRequest () {
        return new MemberRegisterRequest(email, password, city, street, addressDetail, zipcode);
    }
}
