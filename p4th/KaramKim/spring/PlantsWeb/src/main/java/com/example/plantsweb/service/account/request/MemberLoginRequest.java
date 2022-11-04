package com.example.plantsweb.service.account.request;

import lombok.Data;

@Data
public class MemberLoginRequest {

    private final String email;
    private final String password;
}
