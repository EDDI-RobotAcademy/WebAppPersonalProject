package com.example.bucket_list_project.service.member.request.accountSet;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public class ReplaceNicknameRequest {

    private final String nickName;
    private final String currentUserToken;
}
