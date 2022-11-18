package kr.eddi.demo.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.*;

@Entity
@ToString
@Getter
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

    @Getter
    @CreationTimestamp
    private Date createdDate;

    @OneToMany(mappedBy = "member", fetch = FetchType.LAZY)
    @JsonIgnore
    private Set<Authentication> authentications = new HashSet<>();

    @Getter
    @JsonIgnore
    @OneToMany(mappedBy = "member_id", fetch = FetchType.LAZY)
    private List<CommunityBoard> boards = new ArrayList<>();

    @Getter
    @JsonIgnore
    @OneToMany(mappedBy = "member_id", fetch = FetchType.LAZY)
    private List<BoardComment> comments = new ArrayList<>();

    public ReadUsMember(String email, String nickName, String biography) {
        this.email = email;
        this.nickName = nickName;
        this.biography = biography;
    }

    public void updateCommunityBoard(CommunityBoard communityBoard) {
        this.boards.add(communityBoard);
    }

    public void deleteCommunityBoard(CommunityBoard communityBoard) {
        this.boards.remove(communityBoard);
    }

    public void updateComment(BoardComment comment) {
        this.comments.add(comment);
    }

    public void deleteComment(BoardComment comment) {
        this.comments.remove(comment);
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
