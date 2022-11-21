package personal_project.look_style.service.board;

import org.springframework.web.multipart.MultipartFile;
import personal_project.look_style.entity.board.Board;
import personal_project.look_style.service.board.request.BoardRequest;

import java.util.List;

public interface BoardService {

    public void register(BoardRequest request, List<MultipartFile> file);
    public void register(BoardRequest request);
    public List<Board> list();
    public Board read(Long boardNo);
    public void modify(Board board);
    public void remove(Long boardNo);
}
