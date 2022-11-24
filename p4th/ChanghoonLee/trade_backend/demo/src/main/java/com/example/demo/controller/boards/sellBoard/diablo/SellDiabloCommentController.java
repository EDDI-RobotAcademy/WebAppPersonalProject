package com.example.demo.controller.boards.sellBoard.diablo;

import com.example.demo.controller.boards.commentRequest.CommentRequest;
import com.example.demo.entity.boards.sellBoard.diablo.SellDiabloComment;
import com.example.demo.service.boards.sellBoard.diablo.SellDiabloCommentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("trade-item/boards/sell/diablo/comment")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class SellDiabloCommentController {

    @Autowired
    SellDiabloCommentService sellDiabloCommentService;

    @GetMapping("/{sellDiabloNo}")
    public List<SellDiabloComment> sellDiabloCommentList() {
        log.info("sellDiabloCommentList()");

        return sellDiabloCommentService.sellDiabloCommentList();
    }

    @PostMapping("/register")
    public void sellDiabloCommentRegister(@RequestBody CommentRequest commentRequest) {
        log.info("sellDiabloCommentRegister()");

        sellDiabloCommentService.sellDiabloCommentRegister(commentRequest);
    }
}
