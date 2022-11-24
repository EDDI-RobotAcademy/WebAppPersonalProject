package com.example.backend.service.member.request;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemberSignInRequest {
    private String email;
    private String password;
}
