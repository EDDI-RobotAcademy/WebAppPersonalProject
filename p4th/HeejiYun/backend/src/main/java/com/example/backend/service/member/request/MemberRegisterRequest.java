package com.example.backend.service.member.request;

import com.example.backend.entity.member.Member;
import lombok.*;

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
