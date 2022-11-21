package com.example.backend.service.board.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BoardResponse {
    private Long boardNo;
    private String title;
    private String writer;
    private String content;
    private String categoryName;
    private Date regDate;
}
