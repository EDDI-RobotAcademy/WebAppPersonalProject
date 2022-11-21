package com.example.demo.controller.comment;

import com.example.demo.controller.comment.request.CommentRequest;
import com.example.demo.entity.comment.Comment;
import com.example.demo.service.comment.CommentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/comment")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class CommentController {

    /**
     * 댓글 등록 메서드
     */
    @Autowired
    private CommentService service;

    @PostMapping("/register")
    public void commentRegister (@RequestBody CommentRequest commentRequest) {
        log.info("commentRegister()");

        service.register(commentRequest);
    }


}
