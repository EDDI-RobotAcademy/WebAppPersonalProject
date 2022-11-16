package kr.eddi.demo.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class BoardComment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long commentNo;

    @Column(nullable = false)
    private String writer; // 닉네임
    @Column(nullable = false)
    private String comment; // 댓글 내용

    @CreationTimestamp
    private Date createdDate;

    @UpdateTimestamp
    private Date updatedDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "board_no")
    @JsonIgnore
    private CommunityBoard board_no;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "member_id")
    private ReadUsMember member_id;


    public BoardComment(String comment, CommunityBoard board, ReadUsMember member) {
        this.writer = member.getNickName();
        this.comment = comment;
        this.board_no = board;
        this.member_id = member;
    }

    public void modifyComment(String comment) {
        this.comment = comment;
    }

    public void updateCommentToBoard() {
        this.board_no.updateComment(this);
    }

    public void deleteCommentToBoard() {
        this.board_no.deleteComment(this);
    }

    public void updateCommentToMember() {
        this.member_id.updateComment(this);
    }

    public void deleteCommentToMember() {
        this.member_id.deleteComment(this);
    }
}
