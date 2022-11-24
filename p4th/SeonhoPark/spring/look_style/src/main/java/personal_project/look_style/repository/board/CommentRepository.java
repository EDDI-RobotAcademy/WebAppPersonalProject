package personal_project.look_style.repository.board;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import personal_project.look_style.entity.board.Comment;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    @Query("select c from Comment c join c.board b where b.boardNo = :boardNo")
    List<Comment> findAllCommentsByBoardNo(Long boardNo);
}
