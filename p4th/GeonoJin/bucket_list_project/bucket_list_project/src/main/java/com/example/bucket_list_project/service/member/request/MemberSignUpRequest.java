package com.example.bucket_list_project.service.member.request;

import com.example.bucket_list_project.entity.member.MemberInfo;
import com.example.bucket_list_project.entity.member.MemberProfile;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public class MemberSignUpRequest {

    private final String email;
    private final String password;
    private final String nickName;

    public MemberInfo toMemberInfo(){
        return new MemberInfo(email, MemberProfile.of(nickName));
    }
}
