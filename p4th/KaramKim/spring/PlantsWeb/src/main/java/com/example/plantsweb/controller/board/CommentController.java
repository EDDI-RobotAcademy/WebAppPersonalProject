package com.example.plantsweb.controller.board;

import com.example.plantsweb.entity.board.Comment;
import com.example.plantsweb.service.board.CommentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/plants/comment")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class CommentController {

    @Autowired
    private CommentService service;

    @PostMapping("/list/{boardNo}")
    public List<Comment> commentList(@PathVariable("boardNo") Long boardNo) {
        log.info("commentList()");

        return service.list(boardNo);
    }
}
