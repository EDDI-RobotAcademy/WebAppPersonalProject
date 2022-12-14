package kr.pjj.demo.entity.board;

import com.fasterxml.jackson.annotation.JsonIgnore;
import kr.pjj.demo.entity.member.Member;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Diary {
    @Id
    @Column(name = "board_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long boardNo;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="category_id")
    private Category category;

    @Column(length = 128, nullable = false)
    private String title;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="member_id")
    private Member member;

    @Column(length = 32, nullable = false)
    private String authority;

    @Column(length = 32, nullable = true)
    private Integer views;

    @Column(length = 32, nullable = true)
    private Integer likes;

    @Column(length = 32, nullable = true)
    private Integer noLikes;

    @Column
    private String content;

    @CreatedDate
    private String regDate;

    @UpdateTimestamp
    private Date updDate;

    @JsonIgnore
    @OneToMany(mappedBy = "diary", fetch = FetchType.EAGER)
    private List<Comment> comments = new ArrayList<>();

    @JsonIgnore
    @OneToMany(mappedBy = "diary", fetch = FetchType.LAZY)
    private List<Image> images = new ArrayList<>();

    @PrePersist
    public void onPrePersist(){
        this.regDate = LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.SHORT));
    }

    //테스트 케이스용 메소드들
    public Diary ( String title, String authority, String content) {
        this.title = title;
        this.authority = authority;
        this.content = content;
    }

    public void modifyDiary(String title, String content){
        this.title= title;
        this.content= content;
    }
    public void setComment (Comment comment) {
        comments.add(comment);
        comment.setDiary(this);
    }

}
