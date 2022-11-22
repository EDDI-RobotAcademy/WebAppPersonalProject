package com.example.look_lend_backend.service.board.request;

import lombok.Getter;

@Getter
public class CommunityBoardRequest {
    private String type;
    private String title;
    private String writer;
    private String content;
}
