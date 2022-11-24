package com.example.demo.controller.boards.sellBoard.baram;

import com.example.demo.controller.boards.boardsRequest.BoardsRequest;
import com.example.demo.entity.boards.sellBoard.baram.SellBaramBoard;
import com.example.demo.service.boards.sellBoard.baram.SellBaramService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("trade-item/boards/sell/baram")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class SellBaramController {
    @Autowired
    private SellBaramService sellBaramService;

    @GetMapping("/list")
    public List<SellBaramBoard> sellBaramBoardList () {
        log.info("sellBaramBoardList()");

        return sellBaramService.sellBaramList();
    }

    @PostMapping("/register")
    public void sellBaramBoardRegister (@RequestBody BoardsRequest boardsRequest) {
        log.info("sellBaramBoardRegister()");

        sellBaramService.sellBaramRegister(boardsRequest);
    }

    @GetMapping("/{sellBaramNo}")
    public SellBaramBoard sellBaramBoardRead (@PathVariable("sellBaramNo") Long sellBaramNo) {
        log.info("sellBaramBoardRead()");

        return sellBaramService.sellBaramRead(sellBaramNo);
    }

    @DeleteMapping("/{sellBaramNo}")
    public void sellBaramBoardRemove (@PathVariable("sellBaramNo") Long sellBaramNo) {
        log.info("sellBaramBoardRemove()");

        sellBaramService.sellBaramRemove(sellBaramNo);
    }

    @PutMapping("/{sellBaramNo}")
    public SellBaramBoard sellBaramBoardModify (@PathVariable("sellBaramNo") Long sellBaramNo, @RequestBody SellBaramBoard sellBaramBoard) {
        log.info("sellBaramBoardModify()");

        sellBaramBoard.setSellBaramNo(sellBaramNo);
        sellBaramService.sellBaramModify(sellBaramBoard);

        return sellBaramBoard;
    }

}
