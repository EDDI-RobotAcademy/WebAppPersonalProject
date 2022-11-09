package kr.pjj.demo.controller.member.boards.exercise.request;

import lombok.Getter;

@Getter
public class DiaryRequest {
    private String writerToken;
    private String title;
    private String category;
    private String authority;
    private String content;

}
