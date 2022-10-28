package kr.eddi.LeaningHelper.entity.member;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long memberNo;

    @Embedded
    MemberTestGrade memberTestGrade;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_memberNo")
    private Member member;

    public void setMember(Member member) {
        this.member = member;
    }
    public MemberProfile(MemberTestGrade memberTestGrade) {
        this.memberTestGrade = memberTestGrade;
    }

    public static MemberProfile of (long wordGrade, long grammarGrade, long readingGrade, long logicGrade) {
        final MemberTestGrade memberTestGrade = MemberTestGrade.of(wordGrade, grammarGrade, readingGrade, logicGrade);
        return new MemberProfile(memberTestGrade);
    }


}
