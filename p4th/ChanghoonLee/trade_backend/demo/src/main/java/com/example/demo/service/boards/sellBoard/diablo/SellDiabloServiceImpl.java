package com.example.demo.service.boards.sellBoard.diablo;

import com.example.demo.controller.boards.boardsRequest.BoardsRequest;
import com.example.demo.entity.boards.sellBoard.diablo.SellDiabloBoard;
import com.example.demo.repository.boards.sellBoard.diablo.SellDiabloRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class SellDiabloServiceImpl implements SellDiabloService {
    @Autowired
    SellDiabloRepository sellDiabloRepository;

    @Override
    public List<SellDiabloBoard> sellDiabloList() {
        return sellDiabloRepository.findAll(Sort.by(Sort.Direction.DESC, "sellDiabloNo"));
    }

    @Override
    public void sellDiabloRegister(BoardsRequest boardsRequest) {
        SellDiabloBoard sellDiabloBoard = new SellDiabloBoard();
        sellDiabloBoard.setTitle(boardsRequest.getTitle());
        sellDiabloBoard.setContent(boardsRequest.getContent());
        sellDiabloBoard.setWriter(boardsRequest.getWriter());

        sellDiabloRepository.save(sellDiabloBoard);
    }

    @Override
    public SellDiabloBoard sellDiabloRead(Long sellDiabloNo) {
        Optional<SellDiabloBoard> maybeBoard = sellDiabloRepository.findById(Long.valueOf(sellDiabloNo));

        if (maybeBoard.equals(Optional.empty())) {
            log.info("Can't read board!!!");
            return null;
        }

        return maybeBoard.get();
    }

    @Override
    public void sellDiabloRemove(Long sellDiabloNo) {
        sellDiabloRepository.deleteById(Long.valueOf(sellDiabloNo));
    }

    @Override
    public void sellDiabloModify(SellDiabloBoard sellDiabloBoard) {
        sellDiabloRepository.save(sellDiabloBoard);
    }


}
