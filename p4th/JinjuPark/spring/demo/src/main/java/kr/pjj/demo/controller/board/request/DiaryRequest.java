package kr.pjj.demo.controller.board.request;

import lombok.Getter;

@Getter
public class DiaryRequest {
    private String writerToken;
    private String title;
    private Long category;
    private String authority;
    private String content;

}
