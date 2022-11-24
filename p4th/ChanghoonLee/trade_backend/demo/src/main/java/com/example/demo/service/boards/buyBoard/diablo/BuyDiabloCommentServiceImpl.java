package com.example.demo.service.boards.buyBoard.diablo;

import com.example.demo.controller.boards.commentRequest.CommentRequest;
import com.example.demo.entity.boards.buyBoard.diablo.BuyDiabloComment;
import com.example.demo.repository.boards.buyBoard.diablo.BuyDiabloCommentRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class BuyDiabloCommentServiceImpl implements BuyDiabloCommentService {

    @Autowired
    BuyDiabloCommentRepository buyDiabloCommentRepository;

    @Override
    public List<BuyDiabloComment> buyDiabloCommentList() {
        return buyDiabloCommentRepository.findAll(Sort.by(Sort.Direction.ASC, "buyDiabloCommentNo"));
    }

    @Override
    public void buyDiabloCommentRegister(CommentRequest commentRequest) {
        BuyDiabloComment buyDiabloComment = new BuyDiabloComment();
        buyDiabloComment.setCommentWriter(commentRequest.getCommentWriter());
        buyDiabloComment.setComment(commentRequest.getComment());

        buyDiabloCommentRepository.save(buyDiabloComment);
    }
}
