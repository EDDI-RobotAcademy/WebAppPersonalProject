package com.example.demo.entity.boards.buyBoard.baram;

import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BuyBaramBoard {
    @Id
    @Getter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long buyBaramNo;

    @Column(length = 128, nullable = false)
    private String title;

    @Column(length = 32, nullable = false)
    private String writer;

    @Lob
    private String content;

    @CreationTimestamp
    private Date regDate;

    @UpdateTimestamp
    private Date updDate;

//    @OneToMany(mappedBy = "buyBaramBoard")
//    private List<BuyBaramComment> comments = new ArrayList<>();

//    public void addComments(BuyBaramComment buyBaramComment) {
//        this.comments.add(buyBaramComment);
//        buyBaramComment.setBuyBaramBoard(this);
//    }

}
