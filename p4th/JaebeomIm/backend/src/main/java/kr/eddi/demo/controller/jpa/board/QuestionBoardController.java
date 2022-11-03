package kr.eddi.demo.controller.jpa.board;
import kr.eddi.demo.controller.jpa.board.request.BoardRequest;
import kr.eddi.demo.controller.jpa.board.request.FreeBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.QuestionBoardRequest;
import kr.eddi.demo.entity.jpa.boards.Board;
import kr.eddi.demo.entity.jpa.boards.FreeBoard;
import kr.eddi.demo.entity.jpa.boards.QuestionBoard;
import kr.eddi.demo.service.jpa.board.BoardService;
import kr.eddi.demo.service.jpa.board.FreeBoardService;
import kr.eddi.demo.service.jpa.board.QuestionBoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("insoya/jpa/board/question")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class QuestionBoardController {

    @Autowired
    private QuestionBoardService service;

    @GetMapping("/list")
    public List<QuestionBoard> boardList () {
        log.info("questionBoardList()");

        return service.list();
    }

    @PostMapping("/register")
    public void boardRegister (@RequestBody QuestionBoardRequest boardRequest) {
        log.info("questionBoardRegister()");

        service.register(boardRequest);
    }

    @GetMapping("/{boardNo}")
    public QuestionBoard boardRead (@PathVariable("boardNo") Long boardNo) {
        log.info("questionBoardRead()");

        return service.read(boardNo);
    }

    @DeleteMapping("/{boardNo}")
    public void boardRemove (@PathVariable("boardNo") Long boardNo) {
        log.info("questionBoardRemove()");

        service.remove(boardNo);
    }

    @PutMapping("/{boardNo}")
    public QuestionBoard boardModify (@PathVariable("boardNo") Long boardNo, @RequestBody QuestionBoard board) {
        log.info("boardModify()");

        board.setBoardNo(boardNo);
        service.modify(board);

        return board;
    }
}