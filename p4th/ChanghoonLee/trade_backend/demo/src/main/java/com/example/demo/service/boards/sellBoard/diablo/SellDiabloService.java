package com.example.demo.service.boards.sellBoard.diablo;

import com.example.demo.controller.boards.boardsRequest.BoardsRequest;
import com.example.demo.entity.boards.sellBoard.diablo.SellDiabloBoard;

import java.util.List;

public interface SellDiabloService {
    public List<SellDiabloBoard> sellDiabloList();
    public void sellDiabloRegister(BoardsRequest boardsRequest);
    public SellDiabloBoard sellDiabloRead(Long sellDiabloNo);
    public void sellDiabloRemove(Long sellDiabloNo);
    public void sellDiabloModify(SellDiabloBoard sellDiabloBoard);

}
