package com.example.demo.controller.boards.buyBoard.baram;

import com.example.demo.controller.boards.boardsRequest.BoardsRequest;
import com.example.demo.entity.boards.buyBoard.baram.BuyBaramBoard;
import com.example.demo.service.boards.buyBoard.baram.BuyBaramService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("trade-item/boards/buy/baram")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class BuyBaramController {
    @Autowired
    private BuyBaramService buyBaramService;

    @GetMapping("/list")
    public List<BuyBaramBoard> buyBaramBoardList () {
        log.info("buyBaramBoardList()");

        return buyBaramService.buyBaramList();
    }

    @PostMapping("/register")
    public void buyBaramBoardRegister (@RequestBody BoardsRequest boardsRequest) {
        log.info("buyBaramBoardRegister()");

        buyBaramService.buyBaramRegister(boardsRequest);
    }

    @GetMapping("/{buyBaramNo}")
    public BuyBaramBoard buyBaramBoardRead (@PathVariable("buyBaramNo") Long buyBaramNo) {
        log.info("buyBaramBoardRead()");

        return buyBaramService.buyBaramRead(buyBaramNo);
    }

}
