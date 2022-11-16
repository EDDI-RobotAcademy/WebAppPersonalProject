package kr.eddi.demo.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CommunityBoard {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long boardNo;

    @Column(length = 32, nullable = false)
    private String category;

    @Column(length = 128, nullable = false)
    private String title;

    @Column(length = 32, nullable = false)
    private String writer; // 닉네임

    @Column(columnDefinition = "LONGTEXT")
    private String contents; // 본문

    @CreationTimestamp
    private Date createdDate;

    @UpdateTimestamp
    private Date updatedDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "member_id")
    private ReadUsMember member_id;

    @OneToMany(mappedBy = "board_no", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    @OrderBy("commentNo asc")
    private List<BoardComment> comments = new ArrayList<>();

    public CommunityBoard(String category, String title, String contents, ReadUsMember member) {
        this.category = category;
        this.title = title;
        this.contents = contents;
        this.writer = member.getNickName();
        this.member_id = member;
    }

    public void updateBoardToMember() {
        this.member_id.updateCommunityBoard(this);
    }

    public void deleteBoardToMember() {
        this.member_id.deleteCommunityBoard(this);
    }

    public void updateComment(BoardComment comment) {
        this.comments.add(comment);
    }

    public void deleteComment(BoardComment comment) {
        this.comments.remove(comment);
    }

    public void modifyBoard(String category, String title, String contents) {
        this.category = category;
        this.title = title;
        this.contents = contents;
    }

}
