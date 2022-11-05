package com.example.plantsweb.controller.account.form;

import com.example.plantsweb.service.account.request.MemberRegisterRequest;
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
    private String name;
    private String city;
    private String street;
    private String addressDetail;
    private String zipcode;

    public MemberRegisterRequest toMemberRegisterRequest () {
        return new MemberRegisterRequest(email, password, name, city, street, addressDetail, zipcode);
    }
}
