package kr.eddi.demo.controller.form;

import kr.eddi.demo.service.request.CommentWriteToBoardRequest;
import lombok.Data;


@Data
public class CommentToBoardForm {

    private Long boardNo;
    private Long member_id;
    private String comment;

    public CommentWriteToBoardRequest toCommentToBoardWriteRequest() {
        return new CommentWriteToBoardRequest(boardNo, member_id, comment);
    }
}
