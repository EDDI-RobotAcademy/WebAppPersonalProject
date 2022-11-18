package com.example.demo.service.member.request;

import com.example.demo.entity.member.MemberProfile;
import com.example.demo.entity.member.TradeItemMember;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public class MemberRegisterRequest {
    private final String email;
    private final String password;

    private final String city;
    private final String street;
    private final String addressDetail;
    private final String zipcode;

    public TradeItemMember toMember () {
        return new TradeItemMember(
                email,
                MemberProfile.of(city, street, addressDetail, zipcode)
        );
    }

}
