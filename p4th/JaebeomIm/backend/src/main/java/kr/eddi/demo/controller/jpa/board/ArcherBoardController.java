package kr.eddi.demo.controller.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.ArcherBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.FreeBoardRequest;
import kr.eddi.demo.entity.jpa.boards.ArcherBoard;
import kr.eddi.demo.entity.jpa.boards.FreeBoard;
import kr.eddi.demo.service.jpa.board.ArcherBoardService;
import kr.eddi.demo.service.jpa.board.FreeBoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("insoya/jpa/board/archer")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class ArcherBoardController {

    @Autowired
    private ArcherBoardService service;

    @GetMapping("/list")
    public List<ArcherBoard> boardList () {
        log.info("boardList()");

        return service.list();
    }

    @PostMapping("/register")
    public void boardRegister (@RequestBody ArcherBoardRequest boardRequest) {
        log.info("boardRegister()");

        service.register(boardRequest);
    }

    @GetMapping("/{boardNo}")
    public ArcherBoard boardRead (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRead()");

        return service.read(boardNo);
    }

    @DeleteMapping("/{boardNo}")
    public void boardRemove (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRemove()");

        service.remove(boardNo);
    }

    @PutMapping("/{boardNo}")
    public ArcherBoard boardModify (@PathVariable("boardNo") Long boardNo, @RequestBody ArcherBoard board) {
        log.info("boardModify()");

        board.setBoardNo(boardNo);
        service.modify(board);

        return board;
    }
}
