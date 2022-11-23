package com.example.look_lend_backend.service.board;

import com.example.look_lend_backend.entity.board.ReviewBoard;
import com.example.look_lend_backend.service.board.request.ReviewBoardRequest;

import java.util.List;

public interface ReviewBoardService {
    public void register (ReviewBoardRequest reviewBoardRequest);
    public List<ReviewBoard> list();
    public ReviewBoard read(Long reviewNo);
    public void modify(ReviewBoard reviewBoard);
    public void remove(Long reviewNo);
}

