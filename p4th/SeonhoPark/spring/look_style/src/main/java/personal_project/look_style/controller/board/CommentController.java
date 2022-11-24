package personal_project.look_style.controller.board;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import personal_project.look_style.controller.board.form.CommentRegisterForm;
import personal_project.look_style.entity.board.Comment;
import personal_project.look_style.service.board.CommentService;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/comment")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class CommentController {

    @Autowired
    CommentService commentService;

    @PostMapping( "/register")
    public void commentRegister(@RequestBody CommentRegisterForm form) {
        commentService.registerComment(form.toCommentRequest());
    }

    @GetMapping("/find/comments/{boardNo}")
    public List<Comment> findAllCommentsOnSpecificBoard(@PathVariable("boardNo") Long boardNo) {
        return commentService.findCommentsOnSpecificBoard(boardNo);
    }

    @PutMapping("/modify/{boardNo}")
    public void modifyComment(@RequestBody Comment comment, @PathVariable("boardNo") Long boardNo) {
        commentService.modifyCommentOnBoard(comment, boardNo);
    }

    @DeleteMapping("/delete/{commentId}")
    public void deleteComment(@PathVariable("commentId") Long commentId) {
        commentService.deleteCommentOnBoard(commentId);
    }
}
