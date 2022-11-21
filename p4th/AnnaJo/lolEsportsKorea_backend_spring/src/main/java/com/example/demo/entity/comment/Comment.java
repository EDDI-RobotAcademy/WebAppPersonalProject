package com.example.demo.entity.comment;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonIgnore
    private Long id;

    @Column(nullable = false)
    private String myTeam;

    @Column(nullable = false)
    private String nickName;

    @Column(nullable = false)
    private String contents;

    @Column(nullable = false)
    private String teamProfile;

    @Column(nullable = false)
    private String date;

}
