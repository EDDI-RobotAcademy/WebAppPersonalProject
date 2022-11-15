package com.example.plantsweb.service.board;

import com.example.plantsweb.controller.board.request.BoardRequest;
import com.example.plantsweb.entity.board.QuestionBoard;

import java.util.List;

public interface QuestionBoardService {

    public List<QuestionBoard> list();
    public void register(BoardRequest boardRequest);
    public QuestionBoard read(Long boardNo);
    public void modify(QuestionBoard questionBoard);
    public void delete(Long boardNo);
}
