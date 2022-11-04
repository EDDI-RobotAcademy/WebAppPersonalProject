package kr.eddi.demo.entity;


import lombok.*;

import javax.persistence.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class MemberProfile {

    @Id
    @Getter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id = null;

    @Getter
    private String nickName;

    @Getter
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

    public void setMember(ReadUsMember member) {
        this.member = member;
    }
}
