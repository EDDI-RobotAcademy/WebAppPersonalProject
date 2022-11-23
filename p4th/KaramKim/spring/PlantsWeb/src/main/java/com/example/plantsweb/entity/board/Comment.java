package com.example.plantsweb.entity.board;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String content;

    @JsonBackReference
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "board_id")
    private QuestionBoard questionBoard;

    @Column(length = 32, nullable = false)
    private String writer;

    @CreationTimestamp
    private LocalDate regDate;

    @UpdateTimestamp
    private LocalDate updDate;

    public Comment(String content) {
        this.content = content;
    }
    public void modifyContent (String content) {
        this.content = content;
    }

}
