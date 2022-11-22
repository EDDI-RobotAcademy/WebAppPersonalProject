package com.example.look_lend_backend.service.board;

import com.example.look_lend_backend.entity.board.LendBoard;
import com.example.look_lend_backend.service.board.request.LendBoardRequest;

import java.util.List;

public interface LendBoardService {
    public void register(LendBoardRequest lendBoardRequest);
    public List<LendBoard> list();
    public LendBoard read(Long lendNo);
    public void modify(LendBoard lendBoard);
    public void remove(Long lendNo);

}
