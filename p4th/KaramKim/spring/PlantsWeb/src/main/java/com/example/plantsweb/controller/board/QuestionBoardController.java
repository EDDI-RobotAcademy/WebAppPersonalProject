package com.example.plantsweb.controller.board;

import com.example.plantsweb.controller.board.request.BoardRequest;
import com.example.plantsweb.entity.board.QuestionBoard;
import com.example.plantsweb.service.board.QuestionBoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/plants/question-board")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class QuestionBoardController {

    @Autowired
    private QuestionBoardService service;

    @PostMapping("/list")
    public List<QuestionBoard> questionBoardList () {
        log.info("questionBoardList()");

        return service.list();
    }
    @PostMapping("/register")
    public void questionBoardRegister (@RequestBody BoardRequest boardRequest) {
        log.info("questionBoardRegister()");

        service.register(boardRequest);
    }
}
