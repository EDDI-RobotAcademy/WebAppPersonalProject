package com.example.plantsweb.service.account.request;

import com.example.plantsweb.entity.account.Member;
import com.example.plantsweb.entity.account.MemberProfile;
import lombok.Data;

@Data
public class MemberRegisterRequest {

    private final String email;
    private final String password;
    private final String name;
    private final String city;
    private final String street;
    private final String addressDetail;
    private final String zipcode;

    public Member toMember () {
        return new Member(
                email,
                MemberProfile.of(name, city, street, addressDetail, zipcode)
        );
    }
}
