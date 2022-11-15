package com.example.plantsweb.service.board;

import com.example.plantsweb.controller.board.request.BoardRequest;
import com.example.plantsweb.entity.board.QuestionBoard;
import com.example.plantsweb.repository.board.QuestionBoardRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class QuestionBoardServiceImpl implements QuestionBoardService{

    @Autowired
    QuestionBoardRepository repository;

    @Override
    public List<QuestionBoard> list() {
        return repository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    }
}
