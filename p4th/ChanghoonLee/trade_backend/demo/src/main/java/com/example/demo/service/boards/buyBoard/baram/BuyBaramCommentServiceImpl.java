package com.example.demo.service.boards.buyBoard.baram;

import com.example.demo.controller.boards.commentRequest.CommentRequest;
import com.example.demo.entity.boards.buyBoard.baram.BuyBaramComment;
import com.example.demo.repository.boards.buyBoard.baram.BuyBaramCommentRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class BuyBaramCommentServiceImpl implements BuyBaramCommentService {

    @Autowired
    BuyBaramCommentRepository buyBaramCommentRepository;

    @Override
    public List<BuyBaramComment> buyBaramCommentList() {
        return buyBaramCommentRepository.findAll(Sort.by(Sort.Direction.ASC, "buyBaramCommentNo"));
    }

    @Override
    public void buyBaramCommentRegister(CommentRequest commentRequest) {
        BuyBaramComment buyBaramComment = new BuyBaramComment();
        buyBaramComment.setCommentWriter(commentRequest.getCommentWriter());
        buyBaramComment.setComment(commentRequest.getComment());

        buyBaramCommentRepository.save(buyBaramComment);
    }
}
