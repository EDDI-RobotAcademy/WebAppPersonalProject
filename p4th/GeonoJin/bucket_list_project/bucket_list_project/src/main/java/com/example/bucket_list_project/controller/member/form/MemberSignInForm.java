package com.example.bucket_list_project.controller.member.form;


import com.example.bucket_list_project.service.member.request.MemberSignInRequest;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemberSignInForm {

    private String email;
    private String password;

    public MemberSignInRequest toMemberSignInRequest(){
        return new MemberSignInRequest(email, password);
    }
}
