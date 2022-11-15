package kr.eddi.demo.controller.jpa.board.request;

import lombok.Getter;

@Getter
public class MageBoardRequest {
    private String title;
    private String writer;
    private String content;
}
