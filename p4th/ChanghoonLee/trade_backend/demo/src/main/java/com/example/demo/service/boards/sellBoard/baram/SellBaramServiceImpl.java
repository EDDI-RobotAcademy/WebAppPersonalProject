package com.example.demo.service.boards.sellBoard.baram;

import com.example.demo.controller.boards.boardsRequest.BoardsRequest;
import com.example.demo.entity.boards.sellBoard.baram.SellBaramBoard;
import com.example.demo.repository.boards.sellBoard.baram.SellBaramRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class SellBaramServiceImpl implements SellBaramService {
    @Autowired
    SellBaramRepository sellBaramRepository;

    @Override
    public List<SellBaramBoard> sellBaramList() {
        return sellBaramRepository.findAll(Sort.by(Sort.Direction.DESC, "sellBaramNo"));
    }

    @Override
    public void sellBaramRegister(BoardsRequest boardsRequest) {
        SellBaramBoard sellBaramBoard = new SellBaramBoard();
        sellBaramBoard.setTitle(boardsRequest.getTitle());
        sellBaramBoard.setContent(boardsRequest.getContent());
        sellBaramBoard.setWriter(boardsRequest.getWriter());

        sellBaramRepository.save(sellBaramBoard);
    }

    @Override
    public SellBaramBoard sellBaramRead(Long sellBaramNo) {
        Optional<SellBaramBoard> maybeBoard = sellBaramRepository.findById(Long.valueOf(sellBaramNo));

        if (maybeBoard.equals(Optional.empty())) {
            log.info("Can't read board!!!");
            return null;
        }

        return maybeBoard.get();
    }

    @Override
    public void sellBaramRemove(Long sellBaramNo) {
        sellBaramRepository.deleteById(Long.valueOf(sellBaramNo));
    }

    @Override
    public void sellBaramModify(SellBaramBoard sellBaramBoard) {
        sellBaramRepository.save(sellBaramBoard);
    }


}
