package com.example.demo.service.boards.sellBoard.baram;

import com.example.demo.controller.boards.commentRequest.CommentRequest;
import com.example.demo.entity.boards.sellBoard.baram.SellBaramComment;
import com.example.demo.repository.boards.sellBoard.baram.SellBaramCommentRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class SellBaramCommentServiceImpl implements SellBaramCommentService {

    @Autowired
    SellBaramCommentRepository sellBaramCommentRepository;

    @Override
    public List<SellBaramComment> sellBaramCommentList() {
        return sellBaramCommentRepository.findAll(Sort.by(Sort.Direction.ASC, "sellBaramCommentNo"));
    }

    @Override
    public void sellBaramCommentRegister(CommentRequest commentRequest) {
        SellBaramComment sellBaramComment = new SellBaramComment();
        sellBaramComment.setCommentWriter(commentRequest.getCommentWriter());
        sellBaramComment.setComment(commentRequest.getComment());

        sellBaramCommentRepository.save(sellBaramComment);
    }
}
