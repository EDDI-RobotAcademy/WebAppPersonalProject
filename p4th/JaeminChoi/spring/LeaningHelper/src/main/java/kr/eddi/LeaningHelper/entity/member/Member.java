package kr.eddi.LeaningHelper.entity.member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.*;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long memberNo;

    @Column(name = "member_email",length = 30,nullable = false)
    private String email;

    @Column(length = 64,nullable = false)
    private String nickName;

    @CreationTimestamp
    private Date regDate;

    @UpdateTimestamp
    private Date updDate;

    @OneToOne(mappedBy = "member", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private MemberProfile profile;

    public Member(String email, String nickName){
        this.email = email;
        this.nickName = nickName;
    }

    @OneToMany(mappedBy = "member", fetch = FetchType.LAZY)
    final private Set<MemberAuth> memberAuths = new HashSet<>();


    public boolean isRightPassword(String plainToCheck) {
        final Optional<MemberAuth> maybeBasicAuth = findBasicAuthentication();

        if (maybeBasicAuth.isPresent()) {
            final MemberBasicAuth auth = (MemberBasicAuth) maybeBasicAuth.get();
            return auth.isRightPassword(plainToCheck);
        }

        return false;
    }

    private Optional<MemberAuth> findBasicAuthentication() {
        return memberAuths
                .stream()
                .filter(auth -> auth instanceof MemberBasicAuth)
                .findFirst();
    }
}
