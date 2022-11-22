package com.example.plantsweb.service.board;

import com.example.plantsweb.controller.board.request.CommentRequest;
import com.example.plantsweb.entity.board.Comment;

import java.util.List;

public interface CommentService {

    public List<Comment> list(Long boardNo);

    public void register(Long boardNo, CommentRequest commentRequest);

//    public void modify(Long boardNo, Comment comment);
    public void modify(Long id, CommentRequest commentRequest);

    public void delete(Long id);

}
