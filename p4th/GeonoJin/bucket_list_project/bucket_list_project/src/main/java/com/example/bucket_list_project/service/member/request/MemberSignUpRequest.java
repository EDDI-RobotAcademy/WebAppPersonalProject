package com.example.bucket_list_project.service.member.request;

import com.example.bucket_list_project.entity.member.MemberInfo;
import com.example.bucket_list_project.entity.member.MemberProfile;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class MemberSignUpRequest {

    private String email;
    private String password;
    private String nickName;

    public MemberSignUpRequest(String email, String password, String nickName) {
        this.email = email;
        this.password = password;
        this.nickName = nickName;
    }

    public MemberInfo memberInfo(){
        return new MemberInfo(email, MemberProfile.of(nickName));
    }
}
