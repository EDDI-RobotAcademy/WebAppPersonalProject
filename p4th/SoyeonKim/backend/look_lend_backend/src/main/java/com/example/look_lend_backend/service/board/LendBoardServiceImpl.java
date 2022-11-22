package com.example.look_lend_backend.service.board;

import com.example.look_lend_backend.entity.board.LendBoard;
import com.example.look_lend_backend.repository.board.LendBoardRepository;
import com.example.look_lend_backend.service.board.request.LendBoardRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class LendBoardServiceImpl implements LendBoardService {

    @Autowired
    LendBoardRepository repository;


    @Override
    public void register(LendBoardRequest lendBoardRequest) {
        LendBoard lendBoard = new LendBoard();
        lendBoard.setTitle(lendBoardRequest.getTitle());
        lendBoard.setContent(lendBoardRequest.getContent());
        lendBoard.setPrice(lendBoardRequest.getPrice());
        lendBoard.setWriter(lendBoardRequest.getWriter());

        repository.save(lendBoard);
    }

    @Override
    public List<LendBoard> list() {

        return repository.findAll(Sort.by(Sort.Direction.DESC,"lendNo"));

    }

    @Override
    public LendBoard read(Long lendNo) {

        Optional<LendBoard> maybeLendBoard = repository.findById(lendNo);

        if(maybeLendBoard.equals(Optional.empty())) {
            log.info("Can't read lendBoard info!!!");
            return null;
        }

        return maybeLendBoard.get();
    }

    @Override
    public void modify(LendBoard lendBoard) {
        repository.save(lendBoard);
    }

    @Override
    public void remove(Long lendNo) {
        repository.deleteById(lendNo);
    }
}
