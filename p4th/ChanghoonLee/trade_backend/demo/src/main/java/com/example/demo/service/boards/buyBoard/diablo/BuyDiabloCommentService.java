package com.example.demo.service.boards.buyBoard.diablo;

import com.example.demo.controller.boards.commentRequest.CommentRequest;
import com.example.demo.entity.boards.buyBoard.diablo.BuyDiabloComment;

import java.util.List;

public interface BuyDiabloCommentService {
    public List<BuyDiabloComment> buyDiabloCommentList();
    public void buyDiabloCommentRegister(CommentRequest commentRequest);
}
