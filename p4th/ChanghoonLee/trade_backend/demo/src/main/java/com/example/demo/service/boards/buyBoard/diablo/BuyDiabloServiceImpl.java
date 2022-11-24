package com.example.demo.service.boards.buyBoard.diablo;

import com.example.demo.controller.boards.boardsRequest.BoardsRequest;
import com.example.demo.entity.boards.buyBoard.diablo.BuyDiabloBoard;
import com.example.demo.repository.boards.buyBoard.diablo.BuyDiabloRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class BuyDiabloServiceImpl implements BuyDiabloService {
    @Autowired
    BuyDiabloRepository buyDiabloRepository;

    @Override
    public List<BuyDiabloBoard> buyDiabloList() {
        return buyDiabloRepository.findAll(Sort.by(Sort.Direction.DESC, "buyDiabloNo"));
    }

    @Override
    public void buyDiabloRegister(BoardsRequest boardsRequest) {
        BuyDiabloBoard buyDiabloBoard = new BuyDiabloBoard();
        buyDiabloBoard.setTitle(boardsRequest.getTitle());
        buyDiabloBoard.setContent(boardsRequest.getContent());
        buyDiabloBoard.setWriter(boardsRequest.getWriter());

        buyDiabloRepository.save(buyDiabloBoard);
    }

    @Override
    public BuyDiabloBoard buyDiabloRead(Long buyDiabloNo) {
        Optional<BuyDiabloBoard> maybeBoard = buyDiabloRepository.findById(Long.valueOf(buyDiabloNo));

        if (maybeBoard.equals(Optional.empty())) {
            log.info("Can't read board!!!");
            return null;
        }

        return maybeBoard.get();
    }

    @Override
    public void buyDiabloRemove(Long buyDiabloNo) {
        buyDiabloRepository.deleteById(Long.valueOf(buyDiabloNo));
    }

    @Override
    public void buyDiabloModify(BuyDiabloBoard buyDiabloBoard) {
        buyDiabloRepository.save(buyDiabloBoard);
    }


}
