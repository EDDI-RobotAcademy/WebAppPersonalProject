package com.example.demo.service.boards.buyBoard.baram;

import com.example.demo.controller.boards.commentRequest.CommentRequest;
import com.example.demo.entity.boards.buyBoard.baram.BuyBaramComment;

import java.util.List;

public interface BuyBaramCommentService {
    public List<BuyBaramComment> buyBaramCommentList();
    public void buyBaramCommentRegister(CommentRequest commentRequest);
}
