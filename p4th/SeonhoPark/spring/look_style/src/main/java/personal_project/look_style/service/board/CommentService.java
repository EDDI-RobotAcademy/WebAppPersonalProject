package personal_project.look_style.service.board;

import personal_project.look_style.entity.board.Comment;
import personal_project.look_style.service.board.request.CommentRequest;

import java.util.List;

public interface CommentService {

    void registerComment(CommentRequest request);
    List<Comment> findCommentsOnSpecificBoard(Long boardNo);
    void modifyCommentOnBoard(Comment comment, Long boardNo);
    void deleteCommentOnBoard(Long commentId);
}
