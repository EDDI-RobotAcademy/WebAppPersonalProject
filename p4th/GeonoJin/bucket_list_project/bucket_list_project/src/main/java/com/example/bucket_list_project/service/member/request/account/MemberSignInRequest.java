package com.example.bucket_list_project.service.member.request.account;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public class MemberSignInRequest {

    private final String email;
    private final String password;
}
