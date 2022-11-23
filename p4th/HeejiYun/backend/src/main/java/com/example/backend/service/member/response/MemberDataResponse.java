package com.example.backend.service.member.response;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class MemberDataResponse {
    String userEmail;
    String userNickname;
}
