package kr.eddi.demo.controller.board.request;

import lombok.Getter;

@Getter

public class BoardRequest {

    private String title;
    private String writer;
    private String content;

    public BoardRequest(String title, String writer, String content){
        this.title = title;
        this.writer = writer;
        this.content = content;

    }


}
