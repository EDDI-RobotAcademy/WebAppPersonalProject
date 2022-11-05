package com.example.demo.service.member.request;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class MemberSigninRequest {
    private String email;
    private String password;
}