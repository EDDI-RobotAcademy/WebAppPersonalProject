package com.example.demo.service.boards.sellBoard.baram;

import com.example.demo.controller.boards.commentRequest.CommentRequest;
import com.example.demo.entity.boards.sellBoard.baram.SellBaramComment;

import java.util.List;

public interface SellBaramCommentService {
    public List<SellBaramComment> sellBaramCommentList();
    public void sellBaramCommentRegister(CommentRequest commentRequest);
}
