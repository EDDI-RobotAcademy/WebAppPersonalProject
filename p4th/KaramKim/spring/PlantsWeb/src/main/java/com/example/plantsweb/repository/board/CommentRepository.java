package com.example.plantsweb.repository.board;

import com.example.plantsweb.entity.board.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    @Query("select c from Comment c join c.questionBoard qb where qb.boardNo = :boardId")
    List<Comment> findAllCommentsByBoardId(Long boardId);
}
