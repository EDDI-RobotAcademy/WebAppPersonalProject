package com.example.demo.service.boards.sellBoard.diablo;

import com.example.demo.controller.boards.commentRequest.CommentRequest;
import com.example.demo.entity.boards.sellBoard.diablo.SellDiabloComment;
import com.example.demo.repository.boards.sellBoard.diablo.SellDiabloCommentRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class SellDiabloCommentServiceImpl implements SellDiabloCommentService {

    @Autowired
    SellDiabloCommentRepository sellDiabloCommentRepository;

    @Override
    public List<SellDiabloComment> sellDiabloCommentList() {
        return sellDiabloCommentRepository.findAll(Sort.by(Sort.Direction.ASC, "sellDiabloCommentNo"));
    }

    @Override
    public void sellDiabloCommentRegister(CommentRequest commentRequest) {
        SellDiabloComment sellDiabloComment = new SellDiabloComment();
        sellDiabloComment.setCommentWriter(commentRequest.getCommentWriter());
        sellDiabloComment.setComment(commentRequest.getComment());

        sellDiabloCommentRepository.save(sellDiabloComment);
    }
}
