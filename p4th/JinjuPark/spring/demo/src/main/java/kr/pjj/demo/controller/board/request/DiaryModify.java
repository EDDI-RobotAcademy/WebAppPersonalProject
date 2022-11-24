package kr.pjj.demo.controller.board.request;

import lombok.Getter;

@Getter
public class DiaryModify {
    private Long boardNo;
    private String title;
    private String content;
}
