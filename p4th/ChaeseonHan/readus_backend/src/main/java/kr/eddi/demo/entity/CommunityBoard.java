package kr.eddi.demo.entity;


import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CommunityBoard {

    @Id
    @Getter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long boardNo = null;

    @Column(length = 32, nullable = false)
    private String category;

    @Column(length = 128, nullable = false)
    private String title;

    @Column(length = 32, nullable = false)
    private String writer;

    @Lob
    private String content;

    @CreationTimestamp
    private Date createdDate;

    @UpdateTimestamp
    private Date updatedDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private ReadUsMember readUsMember;

    public void modifyBoard(String title, String content) {
        this.title = title;
        this.content = content;
    }

}
