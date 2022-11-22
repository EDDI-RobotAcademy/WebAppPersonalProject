package com.example.plantsweb.entity.board;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
public class QuestionBoard {

    @Id
    @Column(name = "board_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long boardNo;

    @Column(length = 128, nullable = false)
    private String title;

    @Column(length = 32, nullable = false)
    private String writer;

    @Lob
    private String content;

    @CreationTimestamp
    private LocalDate regDate;

    @UpdateTimestamp
    private LocalDate updDate;

    @JsonManagedReference
    @OneToMany(mappedBy = "questionBoard", fetch = FetchType.EAGER)
    private List<Comment> commentList = new ArrayList<>();



}
