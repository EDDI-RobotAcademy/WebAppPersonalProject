package com.example.demo.service.boards.sellBoard.diablo;

import com.example.demo.controller.boards.commentRequest.CommentRequest;
import com.example.demo.entity.boards.sellBoard.diablo.SellDiabloComment;

import java.util.List;

public interface SellDiabloCommentService {
    public List<SellDiabloComment> sellDiabloCommentList();
    public void sellDiabloCommentRegister(CommentRequest commentRequest);
}
