package kr.pjj.demo.controller.board;

import kr.pjj.demo.controller.board.request.CommentDeleteId;
import kr.pjj.demo.controller.board.request.CommentModify;
import kr.pjj.demo.controller.board.request.CommentRequest;
import kr.pjj.demo.entity.board.Comment;
import kr.pjj.demo.service.board.CommentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("hometwang/boards/diary/comment")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class CommentController {

    @Autowired
    private CommentService service;

    @PostMapping("/register")
    public void commentRegister (@RequestBody CommentRequest commentRequest) {
        log.info(" 댓글 등록()- boardNo:" +commentRequest.getBoardNo()+"parentsId: "+commentRequest.getParentsCommentId());
        log.info(" 댓글 등록()- memberId:" +commentRequest.getWriterId()+"comment: "+commentRequest.getContent());

        service.register(commentRequest);
    }

    @GetMapping("/{boardNo}")
    public List<Comment> commentRead (@PathVariable("boardNo") Long boardNo) {
        log.info("댓글 Read()");

        return service.read(boardNo);
    }

    @PutMapping("/{commentId}")
    public void commentModify (@PathVariable("commentId") Long commentId, @RequestBody CommentModify commentModify) {
        log.info("댓글 수정 () 번호: "+ commentId);

        service.modify(commentId, commentModify);
        log.info("댓글 서비스 수정 진행 했음");
    }

    @PostMapping("/delete")
    public void commentRemove (@RequestBody CommentDeleteId commentDeleteId) {

        Long commentId = commentDeleteId.getId();
        log.info("댓글 삭제(): "+ commentId);

        service.remove(commentId);
    }

}