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

    /**
     * 팀 별 코멘트를 찾아 리스트로 반환해주는 메서드
     * @param myTeam 댓글을 등록한 팀 명
     * @return 해당 팀에 등록된 댓글 리스트 반환
     */
    @GetMapping("/{myTeam}")
    public List<Comment> teamCommentList (@PathVariable("myTeam") String myTeam) {
        log.info("teamCommentList()");

        return service.getTeamCommentList(myTeam);
    }
}
