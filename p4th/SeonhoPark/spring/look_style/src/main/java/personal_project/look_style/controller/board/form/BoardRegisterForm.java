package personal_project.look_style.controller.board.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import personal_project.look_style.service.board.request.BoardRequest;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class BoardRegisterForm {

    String title;
    String writer;
    String content;
    String boardType;

    public BoardRequest toBoardRequest() {
        return new BoardRequest(title, writer, content, boardType);
    }
}
