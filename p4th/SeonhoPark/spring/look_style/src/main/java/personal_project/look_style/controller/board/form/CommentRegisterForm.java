package personal_project.look_style.controller.board.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import personal_project.look_style.service.board.request.CommentRequest;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class CommentRegisterForm {

    Long boardNo;
    String writer;
    String content;

    public CommentRequest toCommentRequest() {
        return new CommentRequest(boardNo, writer, content);
    }
}
