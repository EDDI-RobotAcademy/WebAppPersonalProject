package com.example.demo.controller.boards.buyBoard.baram;

import com.example.demo.entity.boards.buyBoard.baram.BuyBaramComment;
import com.example.demo.service.boards.buyBoard.baram.BuyBaramCommentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("trade-item/boards/buy/baram/comment")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class BuyBaramCommentController {

    @Autowired
    BuyBaramCommentService buyBaramCommentService;

    @GetMapping("/{buyBaramNo}")
    public List<BuyBaramComment> buyBaramCommentList() {
        log.info("buyBaramCommentList()");

        return buyBaramCommentService.buyBaramCommentList();
    }


}
