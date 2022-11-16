package kr.eddi.demo.entity;


import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CommunityBoard {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long boardNo = null;

    @Column(length = 32, nullable = false)
    private String category;

    @Column(length = 128, nullable = false)
    private String title;

    @Column(length = 32, nullable = false)
    private String writer;

    @Column(columnDefinition = "LONGTEXT")
    private String contents;

    @CreationTimestamp
    private Date createdDate;

    @UpdateTimestamp
    private Date updatedDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "member_id")
    private ReadUsMember member_id;

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

    public void modifyBoard(String title, String contents) {
        this.title = title;
        this.contents = contents;
    }

}
