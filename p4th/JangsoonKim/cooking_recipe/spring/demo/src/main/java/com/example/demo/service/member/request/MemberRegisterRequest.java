package com.example.demo.service.member.request;

import com.example.demo.entity.member.Member;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public class MemberRegisterRequest {

    private final String email;
    private final String password;
    private final String nickname;

    public Member toMember () {
        return new Member( email, nickname );
    }
}