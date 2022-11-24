package com.example.demo.controller.boards.buyBoard.diablo;

import com.example.demo.controller.boards.commentRequest.CommentRequest;
import com.example.demo.entity.boards.buyBoard.diablo.BuyDiabloComment;
import com.example.demo.service.boards.buyBoard.diablo.BuyDiabloCommentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("trade-item/boards/buy/diablo/comment")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class BuyDiabloCommentController {

    @Autowired
    BuyDiabloCommentService buyDiabloCommentService;

    @GetMapping("/{buyDiabloNo}")
    public List<BuyDiabloComment> buyDiabloCommentList() {
        log.info("buyDiabloCommentList()");

        return buyDiabloCommentService.buyDiabloCommentList();
    }

    @PostMapping("/register")
    public void buyDiabloCommentRegister(@RequestBody CommentRequest commentRequest) {
        log.info("buyDiabloCommentRegister()");

        buyDiabloCommentService.buyDiabloCommentRegister(commentRequest);
    }
}
