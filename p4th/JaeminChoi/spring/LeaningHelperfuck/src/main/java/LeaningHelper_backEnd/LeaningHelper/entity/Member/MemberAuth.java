package LeaningHelper_backEnd.LeaningHelper.entity.Member;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;

@Entity
@ToString(exclude = "member")
@NoArgsConstructor
public class MemberAuth {

    @Id
    @Getter
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id = null;

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
