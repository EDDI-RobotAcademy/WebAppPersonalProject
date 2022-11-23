package personal_project.look_style.controller.board;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import personal_project.look_style.controller.board.form.BoardRegisterForm;
import personal_project.look_style.entity.board.Board;
import personal_project.look_style.entity.board.BoardImage;
import personal_project.look_style.service.board.BoardService;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/board")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @PostMapping(value = "/register", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE, MediaType.APPLICATION_JSON_VALUE})
    public void boardRegister(
            @RequestPart(value = "form") BoardRegisterForm form,
            @RequestPart(value = "file",required = false) List<MultipartFile> file) {

        log.info("게시물 : " + form);
//        log.info(file.getOriginalFilename());

        if (file == null) {
            boardService.register(form.toBoardRequest());
        } else {
            boardService.register(form.toBoardRequest(), file);
        }
    }

    @GetMapping("/list/{boardType}")
    public List<Board> boardList(@PathVariable("boardType") String boardType) {
        log.info("boardList()");

        return boardService.list(boardType);
    }

    @GetMapping("/read/{boardNo}")
    public Board boardRead(@PathVariable("boardNo") Long boardNo) {
        log.info("boardRead()");

        return boardService.read(boardNo);
    }

    @GetMapping("/image/{boardNo}")
    public List<BoardImage> findBoardImagesOnSpecificBoard(@PathVariable("boardNo") Long boardNo) {
        log.info("findBoardImagesOnSpecificBoard()");

        return boardService.findBoardImagesOnSpecificBoard(boardNo);
    }

    @PutMapping(value = "/modify/{boardNo}", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE, MediaType.APPLICATION_JSON_VALUE})
    public void boardModify (@PathVariable("boardNo") Long boardNo,
                              @RequestPart(value = "board") Board board,
                              @RequestPart(value = "file",required = false) List<MultipartFile> file,
                              @RequestParam(value = "imageNo", required = false) Long[] imageNo) {
        log.info("boardModify()");

        if (file == null && imageNo == null) {
            board.setBoardNo(boardNo);
            boardService.modify(board);
        } else {
            board.setBoardNo(boardNo);
            boardService.modify(board, file, imageNo);
        }
    }
}
