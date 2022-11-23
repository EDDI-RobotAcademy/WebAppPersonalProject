package com.example.demo.controller.board;

import com.example.demo.entity.board.Comment;
import com.example.demo.service.recipe.CommentServiceImpl;
import com.example.demo.service.recipe.request.CommentModifyRequest;
import com.example.demo.service.recipe.request.CommentRegisterRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/comment")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class CommentController {

    @Autowired
    CommentServiceImpl service;

    @PostMapping("/register")
    public void registerComment(@RequestBody CommentRegisterRequest request){
        log.info("registerComment()");

        service.register(request);
    }

    @GetMapping("/{recipeNo}")
    public List<Comment> commentList (@PathVariable("recipeNo") Long recipeNo) {
        log.info("commentList()");

        return service.list(recipeNo);
    }

    @PutMapping("/{commentNo}")
    public void commentModify (@PathVariable("commentNo") Long commentNo, @RequestBody CommentModifyRequest request) {
        log.info("commentModify() 번호:"+commentNo+"본문: "+request.getContent() );

        service.modify(commentNo, request);

    }
    @DeleteMapping("/{commentNo}")
    public void commentDelete (@PathVariable("commentNo") Long commentNo) {
        log.info("commentDelete()");

        service.remove(commentNo);

    }
}
