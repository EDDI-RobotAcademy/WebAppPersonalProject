package com.example.plantsweb.entity.account;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@NoArgsConstructor
@AllArgsConstructor
public class MemberProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id = null;

    @Embedded
    private Address address;

    @Column(nullable = false)
    private String name;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;

    private MemberProfile(String name, Address address) {
        this.address = address;
        this.name = name;
    }

    public static MemberProfile of (String name, String city, String street, String addressDetail, String zipcode) {
        final Address address = Address.of(city, street, addressDetail, zipcode);
        return new MemberProfile(name, address);
    }

    public void setMember (Member member) {
        this.member = member;
    }

}
