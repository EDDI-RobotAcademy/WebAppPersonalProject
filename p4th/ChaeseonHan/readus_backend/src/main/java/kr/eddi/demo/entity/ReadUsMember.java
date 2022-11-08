package kr.eddi.demo.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.*;

@Entity
@NoArgsConstructor
@AllArgsConstructor
public class ReadUsMember {

    @Id
    @Getter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Getter
    @Column(nullable = false)
    private String email;

    @Getter
    @Column(nullable = false)
    private String nickName;

    @Getter
    @Column(length = 200)
    private String biography;

    @CreationTimestamp
    private Date createdDate;

    @OneToMany(mappedBy = "member", fetch = FetchType.LAZY)
    private Set<Authentication> authentications = new HashSet<>();

    @OneToMany(mappedBy = "member_id", fetch = FetchType.LAZY)
    private List<CommunityBoard> boards = new ArrayList<>();

    public ReadUsMember(String email, String nickName, String biography) {
        this.email = email;
        this.nickName = nickName;
        this.biography = biography;
    }

    public void updateCommunityBoard(CommunityBoard communityBoard) {
        boards.add(communityBoard);
    }

    public void modifyNickname(String nickName) {
        this.nickName = nickName;
    }

    public void modifyBiography(String biography) {
        this.biography = biography;
    }


    public boolean isRightPassword(String plainToCheck) {
        final Optional<Authentication> maybeBasicAuth = findBasicAuthentication();

        if (maybeBasicAuth.isPresent()) {
            final BasicAuthentication auth = (BasicAuthentication) maybeBasicAuth.get();
            return auth.isRightPassword(plainToCheck);
        }

        return false;
    }


    private Optional<Authentication> findBasicAuthentication() {
        return authentications
                .stream()
                .filter(auth -> auth instanceof BasicAuthentication)
                .findFirst();
    }

}
