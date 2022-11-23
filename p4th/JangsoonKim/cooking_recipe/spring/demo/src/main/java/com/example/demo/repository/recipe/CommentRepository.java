package com.example.demo.repository.recipe;

import com.example.demo.entity.board.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    @Query("select c from Comment c where c.recipeNo = :recipeNo")
    List<Comment> findAllCommentsByRecipeId(Long recipeNo);

    @Query("select c from Comment c where c.writer = :writer")
    List<Comment> findAllCommentsByNickname(String writer);
}
