package com.example.demo.service.boards.buyBoard.diablo;

import com.example.demo.controller.boards.boardsRequest.BoardsRequest;
import com.example.demo.entity.boards.buyBoard.diablo.BuyDiabloBoard;

import java.util.List;

public interface BuyDiabloService {
    public List<BuyDiabloBoard> buyDiabloList();
    public void buyDiabloRegister(BoardsRequest boardsRequest);
    public BuyDiabloBoard buyDiabloRead(Long buyDiabloNo);
    public void buyDiabloRemove(Long buyDiabloNo);
    public void buyDiabloModify(BuyDiabloBoard buyDiabloBoard);

}
