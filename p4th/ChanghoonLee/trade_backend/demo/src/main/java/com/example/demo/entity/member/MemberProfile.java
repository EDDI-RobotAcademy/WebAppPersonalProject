package com.example.demo.entity.member;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
public class MemberProfile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id = null;

    @Embedded
    private Address address;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private TradeItemMember member;

    private MemberProfile(Address address) {
        this.address = address;
    }

    public static MemberProfile of (String city, String street, String addressDetail, String zipcode) {
        final Address address = Address.of(city, street, addressDetail, zipcode);
        return new MemberProfile(address);
    }

    public void setMember (TradeItemMember member) {
        this.member = member;
    }
}
