package kr.pjj.demo.controller.member.boards.exercise.request;

import lombok.Getter;

@Getter
public class CommentRequest {

    private Long boardNo;
    private Long parentsCommentId;
    private String writerNickname;
    private String content;

}
