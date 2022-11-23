package com.example.backend.controller.board;

import com.example.backend.service.board.BoardService;
import com.example.backend.service.board.request.BoardModifyRequest;
import com.example.backend.service.board.request.BoardRegisterRequest;
import com.example.backend.service.board.response.BoardResponse;
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
    public List<BoardResponse> everyBoardList () {
        log.info("everyBoardList()");

        return service.everyBoardList();
    }

    @GetMapping(value = "/list/{categoryName}", produces = "application/json; charset=utf8")
    public List<BoardResponse> specificBoardList (@PathVariable("categoryName") String categoryName) {
        log.info("specificBoardList()");

        return service.specificBoardList(categoryName);
    }

    @PostMapping("/register")
    public boolean boardRegister (@RequestBody BoardRegisterRequest boardRegisterRequest) {
        log.info("boardRegister()");

        return service.register(boardRegisterRequest);
    }

    @GetMapping("/{boardNo}")
    public BoardResponse boardRead (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRead()");

        return service.read(boardNo);
    }

    @DeleteMapping("/{boardNo}")
    public void boardRemove (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRemove()");

        service.remove(boardNo);
    }

    @PutMapping("/{boardNo}")
    public BoardResponse boardModify (@PathVariable("boardNo") Long boardNo, @RequestBody BoardModifyRequest boardModifyRequest) {
        log.info("boardModify()");

        return service.modify(boardNo, boardModifyRequest);
    }
}
