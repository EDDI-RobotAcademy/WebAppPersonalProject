package com.example.demo.service.member.request;

import com.example.demo.entity.member.Member;
import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class MemberSigninRequest {
    private String email;
    private String password;

}