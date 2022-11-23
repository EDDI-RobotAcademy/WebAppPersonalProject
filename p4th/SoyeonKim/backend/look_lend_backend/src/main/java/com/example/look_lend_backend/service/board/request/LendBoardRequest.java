package com.example.look_lend_backend.service.board.request;

import lombok.*;

@Getter
public class LendBoardRequest {
    private String title;
    private String writer;
    private String content;
    private Integer price;
}


