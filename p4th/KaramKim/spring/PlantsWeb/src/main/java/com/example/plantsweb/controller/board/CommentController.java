package com.example.plantsweb.controller.board;

import com.example.plantsweb.controller.board.request.CommentRequest;
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

    @PostMapping("/register/{boardNo}")
    public void commentRegister(@PathVariable("boardNo") Long boardNo,
                                @RequestBody CommentRequest commentRequest) {
        log.info("commentRegister()");

        service.register(boardNo, commentRequest);
    }

//    @PutMapping("/modify/{boardNo}/{id}")
//    public Comment commentModify(@PathVariable("boardNo") Long boardNo,
//                              @PathVariable("id") Long id,
//                              @RequestBody Comment comment) {
//        log.info("commentModify()");
//
//        comment.setId(id);
//        service.modify(boardNo, comment);
//
//        return comment;
//    }
    @PutMapping("/modify/{id}")
    public void commentModify(@PathVariable("id") Long id,
                                 @RequestBody CommentRequest commentRequest) {
        log.info("commentModify()");


        service.modify(id, commentRequest);
    }

    @DeleteMapping("/delete/{id}")
    public void commentDelete(@PathVariable("id") Long id) {
        log.info("commentDelete()");

        service.delete(id);
    }
}
