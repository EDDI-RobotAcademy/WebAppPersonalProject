package kr.pjj.demo.controller.board.request;

import lombok.Getter;

@Getter
public class CommentModify {
    private Long id;
    private Long boardNo;
    private Long parentsCommentId;
    private Long writerId;
    private String writerNickname;
    private String content;
}
