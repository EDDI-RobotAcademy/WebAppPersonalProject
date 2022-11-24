package kr.pjj.demo.controller.board.request;

import lombok.Getter;

@Getter
public class CommentRequest {

    private Long boardNo;
    private Long parentsCommentId;
    private Long writerId;
    private String writerNickname;
    private String content;

}
