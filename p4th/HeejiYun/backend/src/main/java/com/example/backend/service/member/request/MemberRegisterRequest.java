package com.example.backend.service.member.request;

import com.example.backend.entity.member.Member;
import lombok.*;

@Getter
@ToString
@NoArgsConstructor

public class MemberRegisterRequest {
    private String email;
    private String password;
    private String nickname;

    public Member toMember () {
        return new Member( email, nickname );
    }
}
