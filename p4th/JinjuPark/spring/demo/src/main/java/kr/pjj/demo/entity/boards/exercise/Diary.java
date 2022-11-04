package kr.pjj.demo.entity.boards.exercise;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Diary {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long boardNo;

    @Column(length = 32, nullable = false)
    private String category;

    @Column(length = 128, nullable = false)
    private String title;

    @Column(length = 32, nullable = false)
    private String writer;

    @Column(length = 32, nullable = false)
    private String authority;

    @Column(length = 32, nullable = true)
    private Long views;

    @Column(length = 32, nullable = true)
    private Long likes;

    @Lob
    private String content;

    @CreationTimestamp
    private Date regDate;

    @UpdateTimestamp
    private Date updDate;

    public Diary (String category, String title, String writer, String authority, String content) {
        this.category = category;
        this.title = title;
        this.writer = writer;
        this.authority = authority;
        this.content = content;
    }
}
