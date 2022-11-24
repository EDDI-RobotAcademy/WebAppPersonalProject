package com.example.demo.controller.boards.sellBoard.baram;

import com.example.demo.controller.boards.commentRequest.CommentRequest;
import com.example.demo.entity.boards.sellBoard.baram.SellBaramComment;
import com.example.demo.service.boards.sellBoard.baram.SellBaramCommentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("trade-item/boards/sell/baram/comment")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class SellBaramCommentController {

    @Autowired
    SellBaramCommentService sellBaramCommentService;

    @GetMapping("/{sellBaramNo}")
    public List<SellBaramComment> sellBaramCommentList() {
        log.info("sellBaramCommentList()");

        return sellBaramCommentService.sellBaramCommentList();
    }

    @PostMapping("/register")
    public void sellBaramCommentRegister(@RequestBody CommentRequest commentRequest) {
        log.info("sellBaramCommentRegister()");

        sellBaramCommentService.sellBaramCommentRegister(commentRequest);
    }
}
