package com.example.bucket_list_project.service.member.accountSet;

import com.example.bucket_list_project.service.member.request.accountSet.ReplaceNicknameRequest;

public interface MemberAccountSetService {

    void replaceNickname (ReplaceNicknameRequest nicknameRequest);

    void deleteUserinfo(String nickName);
}
