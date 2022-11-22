package com.example.backend.service.member.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class MemberModifyRequest {
    private String userToken;
    private String modifyNickname;
}
