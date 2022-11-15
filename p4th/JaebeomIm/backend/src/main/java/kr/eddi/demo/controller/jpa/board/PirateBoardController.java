package kr.eddi.demo.controller.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.MageBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.PirateBoardRequest;
import kr.eddi.demo.entity.jpa.boards.MageBoard;
import kr.eddi.demo.entity.jpa.boards.PirateBoard;
import kr.eddi.demo.service.jpa.board.MageBoardService;
import kr.eddi.demo.service.jpa.board.PirateBoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("insoya/jpa/board/pirate")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class PirateBoardController {

    @Autowired
    private PirateBoardService service;

    @GetMapping("/list")
    public List<PirateBoard> boardList () {
        log.info("boardList()");

        return service.list();
    }

    @PostMapping("/register")
    public void boardRegister (@RequestBody PirateBoardRequest boardRequest) {
        log.info("boardRegister()");

        service.register(boardRequest);
    }

    @GetMapping("/{boardNo}")
    public PirateBoard boardRead (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRead()");

        return service.read(boardNo);
    }

    @DeleteMapping("/{boardNo}")
    public void boardRemove (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRemove()");

        service.remove(boardNo);
    }

    @PutMapping("/{boardNo}")
    public PirateBoard boardModify (@PathVariable("boardNo") Long boardNo, @RequestBody PirateBoard board) {
        log.info("boardModify()");

        board.setBoardNo(boardNo);
        service.modify(board);

        return board;
    }
}
