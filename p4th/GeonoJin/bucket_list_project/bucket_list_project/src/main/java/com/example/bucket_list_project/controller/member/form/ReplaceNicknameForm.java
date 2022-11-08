package com.example.bucket_list_project.controller.member.form;

import com.example.bucket_list_project.service.member.request.accountSet.ReplaceNicknameRequest;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ReplaceNicknameForm {

    private String nickName;
    private String currentUserToken;

    public ReplaceNicknameRequest toReplaceNicknameRequest(){
        return new ReplaceNicknameRequest(nickName, currentUserToken);
    }
}
