package kr.eddi.demo.controller.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.BoardRequest;
import kr.eddi.demo.controller.jpa.board.request.FreeBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.TradeBoardRequest;
import kr.eddi.demo.entity.jpa.boards.Board;
import kr.eddi.demo.entity.jpa.boards.FreeBoard;
import kr.eddi.demo.entity.jpa.boards.TradeBoard;
import kr.eddi.demo.service.jpa.board.BoardService;
import kr.eddi.demo.service.jpa.board.FreeBoardService;
import kr.eddi.demo.service.jpa.board.TradeBoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("insoya/jpa/board/trade")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class TradeBoardController {

    @Autowired
    private TradeBoardService service;

    @GetMapping("/list")
    public List<TradeBoard> boardList () {
        log.info("boardList()");

        return service.list();
    }

    @PostMapping("/register")
    public void boardRegister (@RequestBody TradeBoardRequest boardRequest) {
        log.info("boardRegister()");

        service.register(boardRequest);
    }

    @GetMapping("/{boardNo}")
    public TradeBoard boardRead (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRead()");

        return service.read(boardNo);
    }

    @DeleteMapping("/{boardNo}")
    public void boardRemove (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRemove()");

        service.remove(boardNo);
    }

    @PutMapping("/{boardNo}")
    public TradeBoard boardModify (@PathVariable("boardNo") Long boardNo, @RequestBody TradeBoard board) {
        log.info("boardModify()");

        board.setBoardNo(boardNo);
        service.modify(board);

        return board;
    }
}