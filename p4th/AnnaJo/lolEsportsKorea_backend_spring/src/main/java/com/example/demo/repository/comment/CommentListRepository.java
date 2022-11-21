package com.example.demo.repository.comment;

import com.example.demo.entity.comment.Comment;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CommentListRepository extends CrudRepository<Comment, Long> {
    List<Comment> findCommentByMyTeamContaining(String searchKeyword);
}
