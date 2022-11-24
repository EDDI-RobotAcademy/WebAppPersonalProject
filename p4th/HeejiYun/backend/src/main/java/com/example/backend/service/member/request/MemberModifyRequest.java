package com.example.backend.service.member.request;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemberModifyRequest {
    private String userToken;
    private String modifyNickname;
}
