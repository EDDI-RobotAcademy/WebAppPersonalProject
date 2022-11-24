package com.example.demo.entity.boards.sellBoard.diablo;

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
public class SellDiabloComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long sellDiabloCommentNo;

    @Column
    private String commentWriter;

    @Lob
    private String comment;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sell_diablo_no")
    private SellDiabloBoard sellDiabloBoard;

    @CreationTimestamp
    private Date regDate;

    @UpdateTimestamp
    private Date updDate;


}
