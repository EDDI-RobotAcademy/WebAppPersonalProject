package personal_project.look_style.service.board.request;

import lombok.Getter;

@Getter
public class CommentRequest {

    private Long boardNo;
    private String writer;
    private String content;

    public CommentRequest(Long boardNo, String writer, String content) {
        this.boardNo = boardNo;
        this.writer = writer;
        this.content = content;
    }
}
