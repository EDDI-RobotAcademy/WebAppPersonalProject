package personal_project.look_style.service.board;

import org.springframework.web.multipart.MultipartFile;
import personal_project.look_style.entity.board.Board;
import personal_project.look_style.entity.board.BoardImage;
import personal_project.look_style.service.board.request.BoardRequest;

import java.util.List;

public interface BoardService {

    public void register(BoardRequest request, List<MultipartFile> file);
    public void register(BoardRequest request);
    public List<Board> list(String boardType);
}
