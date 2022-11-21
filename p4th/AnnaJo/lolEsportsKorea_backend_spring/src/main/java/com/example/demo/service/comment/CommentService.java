package com.example.demo.service.comment;

import com.example.demo.controller.comment.request.CommentRequest;
import com.example.demo.entity.comment.Comment;

import java.util.List;

public interface CommentService {
    public void register(CommentRequest commentRequest);
    public List<Comment> getTeamCommentList(String requestRanking);
}
