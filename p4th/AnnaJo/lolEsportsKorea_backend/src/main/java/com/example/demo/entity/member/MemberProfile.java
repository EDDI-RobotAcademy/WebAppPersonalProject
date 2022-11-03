package com.example.demo.entity.member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
public class MemberProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id = null;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;

    @Getter
    @Column(length = 32, nullable = false)
    private String nickname;

    @Getter
    @Column(nullable = false)
    private int memberPoint;

    private MemberProfile(String nickname, int memberPoint) {
        this.nickname = nickname;
        this.memberPoint = memberPoint;
    }

    public static MemberProfile of(String nickname, int memberPoint) {
        return new MemberProfile(nickname, memberPoint);
    }

    public void setMember (Member member) {
        this.member = member;
    }

}
