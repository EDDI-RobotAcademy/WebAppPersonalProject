package kr.pjj.demo.repository.board;

import kr.pjj.demo.entity.board.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    @Query("select c from Comment c join c.diary dy where dy.boardNo = :boardNo")
    List<Comment> findAllCommentsByBoardId(Long boardNo);
}
