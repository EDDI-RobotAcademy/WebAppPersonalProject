package personal_project.look_style.service.board;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import personal_project.look_style.entity.board.Board;
import personal_project.look_style.entity.board.BoardImage;
import personal_project.look_style.repository.board.BoardImageRepository;
import personal_project.look_style.repository.board.BoardRepository;
import personal_project.look_style.service.board.request.BoardRequest;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService{

    @Autowired
    BoardRepository boardRepository;

    @Autowired
    BoardImageRepository boardImageRepository;

    @Override
    public void register(BoardRequest request, List<MultipartFile> file) {
        Board board = new Board();
        List<BoardImage> boardImageList = new ArrayList<>();

        board.setTitle(request.getTitle());
        board.setWriter(request.getWriter());
        board.setContent(request.getContent());
        board.setBoardType(request.getBoardType());

        int i = 0;

        for (MultipartFile multipartFile: file) {
            BoardImage boardImage = new BoardImage();
            boardImage.setImageName(multipartFile.getOriginalFilename());
            boardImage.setBoard(board);
            boardImageList.add(boardImage);
            try {
                FileOutputStream writer = new FileOutputStream(
                        "C:/web/images/" + multipartFile.getOriginalFilename()
                );
                writer.write(multipartFile.getBytes());
                writer.close();
            } catch (FileNotFoundException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            log.info(String.valueOf(boardImageList.get(i)));
            i++;
        }

        boardRepository.save(board);
        boardImageRepository.saveAll(boardImageList);
    }

    @Override
    public void register(BoardRequest request) {
        Board board = new Board();

        board.setTitle(request.getTitle());
        board.setWriter(request.getWriter());
        board.setContent(request.getContent());
        board.setBoardType(request.getBoardType());

        boardRepository.save(board);
    }

    @Override
    public List<Board> list() {
        return null;
    }

    @Override
    public Board read(Long boardNo) {
        return null;
    }

    @Override
    public void modify(Board board) {

    }

    @Override
    public void remove(Long boardNo) {

    }
}
