package kr.eddi.demo.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id = null;

    private String nickName;

    private String biography;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private ReadUsMember member;

    public MemberProfile (String nickName, String biography) {
        this.nickName = nickName;
        this.biography = biography;
    }

    public void modifyNickname(String nickName) {
        this.nickName = nickName;
    }

    public void modifyBiography(String biography) {
        this.biography = biography;
    }

}
