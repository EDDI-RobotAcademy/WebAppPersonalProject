package com.example.demo.entity.board;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.List;


@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Recipe {

    @Id
    @Column(name = "recipe_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long recipeNo;

    @Column(length = 128, nullable = false)
    private String title;

    @Column(length = 32, nullable = false)
    private String writer;

    @Lob
    private String content;

    @Column(length = 10, nullable = false)
    private String category;

    @Column(length = 100, nullable = false)
    private String thumbnail;

    @Column(length = 100, nullable = false)
    private String keyword;

    @CreatedDate
    private String regDate;

    @JsonIgnore
    @OneToMany(mappedBy = "recipe", fetch = FetchType.EAGER)
    private List<Image> images = new ArrayList<>();

    @Column(length = 10, nullable = false)
    private double rating;

    @Column(length = 32, nullable = false)
    private Integer likeCount;

    @PrePersist
    public void onPrePersist(){
        this.regDate = LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.SHORT));
    }

    public Recipe(String title, String category, String content, String writer) {
        this.title = title;
        this.category = category;
        this.content = content;
        this.writer = writer;
    }
}
