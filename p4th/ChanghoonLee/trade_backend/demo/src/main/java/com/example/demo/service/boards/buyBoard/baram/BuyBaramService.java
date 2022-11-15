package com.example.demo.service.boards.buyBoard.baram;

import com.example.demo.controller.boards.boardsRequest.BoardsRequest;
import com.example.demo.entity.boards.buyBoard.baram.BuyBaramBoard;

import java.util.List;

public interface BuyBaramService {
    public List<BuyBaramBoard> buyBaramList();
    public void buyBaramRegister(BoardsRequest boardsRequest);
    public BuyBaramBoard buyBaramRead(Long buyBaramNo);

}
