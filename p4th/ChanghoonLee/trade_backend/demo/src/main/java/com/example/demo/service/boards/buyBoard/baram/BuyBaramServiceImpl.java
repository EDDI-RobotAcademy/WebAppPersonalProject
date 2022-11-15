package com.example.demo.service.boards.buyBoard.baram;

import com.example.demo.controller.boards.boardsRequest.BoardsRequest;
import com.example.demo.entity.boards.buyBoard.baram.BuyBaramBoard;
import com.example.demo.repository.buyBoard.baram.BuyBaramRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class BuyBaramServiceImpl implements BuyBaramService{
    @Autowired
    BuyBaramRepository buyBaramRepository;

    @Override
    public List<BuyBaramBoard> buyBaramList() {
        return buyBaramRepository.findAll(Sort.by(Sort.Direction.DESC, "buyBaramNo"));
    }

    public void buyBaramRegister(BoardsRequest boardsRequest) {
        BuyBaramBoard buyBaramBoard = new BuyBaramBoard();
        buyBaramBoard.setTitle(boardsRequest.getTitle());
        buyBaramBoard.setContent(boardsRequest.getContent());
        buyBaramBoard.setWriter(boardsRequest.getWriter());

        buyBaramRepository.save(buyBaramBoard);
    }


}
