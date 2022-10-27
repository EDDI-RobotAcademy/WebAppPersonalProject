package kr.eddi.LeaningHelper.entity.member;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;

@Entity
@ToString(exclude = "member")
@NoArgsConstructor
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "authentication_type")
public class MemberAuth {

    public static final String BASIC_AUTH = "BASIC";
    @Id
    @Getter
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long memberNo = null;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_memberNo")
    private Member member;

    @Column(name = "authentication_type", nullable = false, insertable = false, updatable = false)
    private String authenticationType;

    public MemberAuth (Member member, String authenticationType) {
        this.member = member;
        this.authenticationType = authenticationType;
    }
}
