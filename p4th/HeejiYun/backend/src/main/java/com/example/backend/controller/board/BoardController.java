package com.example.backend.controller.board;

import com.example.backend.entity.board.Board;
import com.example.backend.service.board.BoardService;
import com.example.backend.service.board.request.BoardModifyRequest;
import com.example.backend.service.board.request.BoardRegisterRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/board")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class BoardController {

    @Autowired
    private BoardService service;

    @GetMapping("/list")
    public List<Board> everyBoardList () {
        log.info("everyBoardList()");

        return service.everyBoardList();
    }

    @GetMapping("/list/{category}")
    public List<Board> specificBoardList (@PathVariable("category") String category) {
        log.info("specificBoardList()");

        return service.specificBoardList(category);
    }

    @PostMapping("/register")
    public void boardRegister (@RequestBody BoardRegisterRequest boardRegisterRequest) {
        log.info("boardRegister()");

        service.register(boardRegisterRequest);
    }

    @GetMapping("/{boardNo}")
    public Board boardRead (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRead()");

        return service.read(boardNo);
    }

    @DeleteMapping("/{boardNo}")
    public void boardRemove (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRemove()");

        service.remove(boardNo);
    }

    @PutMapping("/{boardNo}")
    public Board boardModify (@PathVariable("boardNo") Long boardNo, @RequestBody BoardModifyRequest boardModifyRequest) {
        log.info("boardModify()");

        return service.modify(boardNo, boardModifyRequest);
    }
}
