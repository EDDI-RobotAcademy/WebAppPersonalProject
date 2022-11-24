package com.example.demo.service.boards.sellBoard.baram;

import com.example.demo.controller.boards.boardsRequest.BoardsRequest;
import com.example.demo.entity.boards.sellBoard.baram.SellBaramBoard;


import java.util.List;

public interface SellBaramService {
    public List<SellBaramBoard> sellBaramList();
    public void sellBaramRegister(BoardsRequest boardsRequest);
    public SellBaramBoard sellBaramRead(Long sellBaramNo);
    public void sellBaramRemove(Long sellBaramNo);
    public void sellBaramModify(SellBaramBoard sellBaramBoard);

}
