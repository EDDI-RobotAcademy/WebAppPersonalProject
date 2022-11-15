package kr.eddi.demo.controller.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.PirateBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.ThiefBoardRequest;
import kr.eddi.demo.entity.jpa.boards.PirateBoard;
import kr.eddi.demo.entity.jpa.boards.ThiefBoard;
import kr.eddi.demo.service.jpa.board.PirateBoardService;
import kr.eddi.demo.service.jpa.board.ThiefBoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("insoya/jpa/board/thief")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class ThiefBoardController {

    @Autowired
    private ThiefBoardService service;

    @GetMapping("/list")
    public List<ThiefBoard> boardList () {
        log.info("boardList()");

        return service.list();
    }

    @PostMapping("/register")
    public void boardRegister (@RequestBody ThiefBoardRequest boardRequest) {
        log.info("boardRegister()");

        service.register(boardRequest);
    }

    @GetMapping("/{boardNo}")
    public ThiefBoard boardRead (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRead()");

        return service.read(boardNo);
    }

    @DeleteMapping("/{boardNo}")
    public void boardRemove (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRemove()");

        service.remove(boardNo);
    }

    @PutMapping("/{boardNo}")
    public ThiefBoard boardModify (@PathVariable("boardNo") Long boardNo, @RequestBody ThiefBoard board) {
        log.info("boardModify()");

        board.setBoardNo(boardNo);
        service.modify(board);

        return board;
    }
}