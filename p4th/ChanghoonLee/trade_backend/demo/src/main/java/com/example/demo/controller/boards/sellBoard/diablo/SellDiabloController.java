package com.example.demo.controller.boards.sellBoard.diablo;

import com.example.demo.controller.boards.boardsRequest.BoardsRequest;
import com.example.demo.entity.boards.sellBoard.diablo.SellDiabloBoard;
import com.example.demo.service.boards.sellBoard.diablo.SellDiabloService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("trade-item/boards/sell/diablo")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class SellDiabloController {
    @Autowired
    private SellDiabloService sellDiabloService;

    @GetMapping("/list")
    public List<SellDiabloBoard> sellDiabloBoardList () {
        log.info("sellDiabloBoardList()");

        return sellDiabloService.sellDiabloList();
    }

    @PostMapping("/register")
    public void sellDiabloBoardRegister (@RequestBody BoardsRequest boardsRequest) {
        log.info("sellDiabloBoardRegister()");

        sellDiabloService.sellDiabloRegister(boardsRequest);
    }

    @GetMapping("/{sellDiabloNo}")
    public SellDiabloBoard sellDiabloBoardRead (@PathVariable("sellDiabloNo") Long sellDiabloNo) {
        log.info("sellDiabloBoardRead()");

        return sellDiabloService.sellDiabloRead(sellDiabloNo);
    }

    @DeleteMapping("/{sellDiabloNo}")
    public void sellDiabloBoardRemove (@PathVariable("sellDiabloNo") Long sellDiabloNo) {
        log.info("sellDiabloBoardRemove()");

        sellDiabloService.sellDiabloRemove(sellDiabloNo);
    }

    @PutMapping("/{sellDiabloNo}")
    public SellDiabloBoard sellDiabloBoardModify (@PathVariable("sellDiabloNo") Long sellDiabloNo, @RequestBody SellDiabloBoard sellDiabloBoard) {
        log.info("sellDiabloBoardModify()");

        sellDiabloBoard.setSellDiabloNo(sellDiabloNo);
        sellDiabloService.sellDiabloModify(sellDiabloBoard);

        return sellDiabloBoard;
    }

}
