package com.example.demo.entity.boards.sellBoard.baram;

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
public class SellBaramComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long sellBaramCommentNo;

    @Column
    private String commentWriter;

    @Lob
    private String comment;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sell_baram_no")
    private SellBaramBoard sellBaramBoard;

    @CreationTimestamp
    private Date regDate;

    @UpdateTimestamp
    private Date updDate;


}
