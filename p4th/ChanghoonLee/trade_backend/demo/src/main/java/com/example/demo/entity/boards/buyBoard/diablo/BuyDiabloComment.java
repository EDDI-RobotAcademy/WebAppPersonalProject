package com.example.demo.entity.boards.buyBoard.diablo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BuyDiabloComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long buyDiabloCommentNo;

    @Column
    private String commentWriter;

    @Lob
    private String comment;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "buy_diablo_no")
    private BuyDiabloBoard buyDiabloBoard;

    @CreationTimestamp
    private Date regDate;

    @UpdateTimestamp
    private Date updDate;


}
