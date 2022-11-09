package kr.eddi.demo.controller.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.GradeUpBoardRequest;
import kr.eddi.demo.entity.jpa.boards.GradeUpBoard;
import kr.eddi.demo.service.jpa.board.GradeUpBoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("insoya/jpa/board/grade-up")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class GradeUpBoardController {

    @Autowired
    private GradeUpBoardService service;

    @GetMapping("/list")
    public List<GradeUpBoard> boardList () {
        log.info("boardList()");

        return service.list();
    }

    @PostMapping("/register")
    public void boardRegister (@RequestBody GradeUpBoardRequest boardRequest) {
        log.info("boardRegister()");

        service.register(boardRequest);
    }

    @GetMapping("/{boardNo}")
    public GradeUpBoard boardRead (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRead()");

        return service.read(boardNo);
    }

    @DeleteMapping("/{boardNo}")
    public void boardRemove (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRemove()");

        service.remove(boardNo);
    }

    @PutMapping("/{boardNo}")
    public GradeUpBoard boardModify (@PathVariable("boardNo") Long boardNo, @RequestBody GradeUpBoard board) {
        log.info("boardModify()");

        board.setBoardNo(boardNo);
        service.modify(board);

        return board;
    }
}