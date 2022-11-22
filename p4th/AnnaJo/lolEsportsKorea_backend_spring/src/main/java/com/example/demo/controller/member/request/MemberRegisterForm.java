package com.example.demo.controller.member.request;

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

    private String nickname;

    public MemberRegisterRequest toMemberRegisterRequest() {
        return new MemberRegisterRequest(email, password, nickname);
    }
}
