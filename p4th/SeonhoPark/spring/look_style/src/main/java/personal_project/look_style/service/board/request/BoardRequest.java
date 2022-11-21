package personal_project.look_style.service.board.request;

import lombok.Getter;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Getter
public class BoardRequest {

    private String title;
    private String writer;
    private String content;
    private String boardType;

    public BoardRequest(String title, String writer, String content, String boardType) {
        this.title = title;
        this.writer = writer;
        this.content = content;
        this.boardType = boardType;
    }
}
