package kr.eddi.demo.controller.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.ThiefBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.WarriorBoardRequest;
import kr.eddi.demo.entity.jpa.boards.ThiefBoard;
import kr.eddi.demo.entity.jpa.boards.WarriorBoard;
import kr.eddi.demo.service.jpa.board.ThiefBoardService;
import kr.eddi.demo.service.jpa.board.WarriorBoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("insoya/jpa/board/warrior")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class WarriorBoardController {

    @Autowired
    private WarriorBoardService service;

    @GetMapping("/list")
    public List<WarriorBoard> boardList () {
        log.info("boardList()");

        return service.list();
    }

    @PostMapping("/register")
    public void boardRegister (@RequestBody WarriorBoardRequest boardRequest) {
        log.info("boardRegister()");

        service.register(boardRequest);
    }

    @GetMapping("/{boardNo}")
    public WarriorBoard boardRead (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRead()");

        return service.read(boardNo);
    }

    @DeleteMapping("/{boardNo}")
    public void boardRemove (@PathVariable("boardNo") Long boardNo) {
        log.info("boardRemove()");

        service.remove(boardNo);
    }

    @PutMapping("/{boardNo}")
    public WarriorBoard boardModify (@PathVariable("boardNo") Long boardNo, @RequestBody WarriorBoard board) {
        log.info("boardModify()");

        board.setBoardNo(boardNo);
        service.modify(board);

        return board;
    }
}
