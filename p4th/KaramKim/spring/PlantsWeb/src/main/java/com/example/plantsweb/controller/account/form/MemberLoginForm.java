package com.example.plantsweb.controller.account.form;

import com.example.plantsweb.service.account.request.MemberLoginRequest;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemberLoginForm {

    private String email;
    private String password;

    public MemberLoginRequest toLoginRequest () {
        return new MemberLoginRequest(email, password);
    }
}
