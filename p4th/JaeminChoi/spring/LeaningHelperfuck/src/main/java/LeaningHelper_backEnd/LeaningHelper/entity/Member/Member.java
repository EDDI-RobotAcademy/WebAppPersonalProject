package LeaningHelper_backEnd.LeaningHelper.entity.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long memberNo;

    @Column(length = 30,nullable = false)
    private String id;

    @Column(length = 30,nullable = false)
    private String pw;

    @Column(length = 64,nullable = false)
    private String nickName;

    @CreationTimestamp
    private Date regDate;

    @UpdateTimestamp
    private Date updDate;

    @OneToMany(mappedBy = "member", fetch = FetchType.LAZY)
    private Set<MemberAuth> authentications = new HashSet<>();

    @OneToOne(mappedBy = "member", fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
    private MemberProfile profile;

    public Member(String id, String pw, String nickName){
        this.id = id;
        this.pw = pw;
        this.nickName = nickName;
    }
}
