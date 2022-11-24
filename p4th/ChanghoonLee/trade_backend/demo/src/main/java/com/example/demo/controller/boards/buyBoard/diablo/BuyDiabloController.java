package com.example.demo.controller.boards.buyBoard.diablo;

import com.example.demo.controller.boards.boardsRequest.BoardsRequest;

import com.example.demo.entity.boards.buyBoard.diablo.BuyDiabloBoard;
import com.example.demo.service.boards.buyBoard.diablo.BuyDiabloService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("trade-item/boards/buy/diablo")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class BuyDiabloController {
    @Autowired
    private BuyDiabloService buyDiabloService;

    @GetMapping("/list")
    public List<BuyDiabloBoard> buyDiabloBoardList () {
        log.info("buyDiabloBoardList()");

        return buyDiabloService.buyDiabloList();
    }

    @PostMapping("/register")
    public void buyDiabloBoardRegister (@RequestBody BoardsRequest boardsRequest) {
        log.info("buyDiabloBoardRegister()");

        buyDiabloService.buyDiabloRegister(boardsRequest);
    }

    @GetMapping("/{buyDiabloNo}")
    public BuyDiabloBoard buyDiabloBoardRead (@PathVariable("buyDiabloNo") Long buyDiabloNo) {
        log.info("buyDiabloBoardRead()");

        return buyDiabloService.buyDiabloRead(buyDiabloNo);
    }

    @DeleteMapping("/{buyDiabloNo}")
    public void buyDiabloBoardRemove (@PathVariable("buyDiabloNo") Long buyDiabloNo) {
        log.info("buyDiabloBoardRemove()");

        buyDiabloService.buyDiabloRemove(buyDiabloNo);
    }

    @PutMapping("/{buyDiabloNo}")
    public BuyDiabloBoard buyDiabloBoardModify (@PathVariable("buyDiabloNo") Long buyDiabloNo, @RequestBody BuyDiabloBoard buyDiabloBoard) {
        log.info("buyDiabloBoardModify()");

        buyDiabloBoard.setBuyDiabloNo(buyDiabloNo);
        buyDiabloService.buyDiabloModify(buyDiabloBoard);

        return buyDiabloBoard;
    }

}
