package com.example.plantsweb.service.board;

import com.example.plantsweb.controller.board.request.BoardRequest;
import com.example.plantsweb.entity.board.QuestionBoard;

import java.util.List;

public interface QuestionBoardService {

    public List<QuestionBoard> list();
}
