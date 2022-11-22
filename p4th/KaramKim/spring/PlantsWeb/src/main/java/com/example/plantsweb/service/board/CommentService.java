package com.example.plantsweb.service.board;

import com.example.plantsweb.entity.board.Comment;

import java.util.List;

public interface CommentService {

    public List<Comment> list(Long boardNo);

//    public void writeComment(Long boardNo);

}
