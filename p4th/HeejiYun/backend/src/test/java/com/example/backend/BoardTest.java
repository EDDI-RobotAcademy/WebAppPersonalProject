package com.example.backend;

import com.example.backend.service.board.BoardService;
import com.example.backend.service.board.request.BoardRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestExecutionListeners;

@SpringBootTest
public class BoardTest {
    @Autowired
    BoardService service;

    @Test
    void registerTest() {
        BoardRequest boardRequest =
                new BoardRequest("정숙이 원맨쇼", "정숙", "히히", "질문");

        service.register(boardRequest);
    }

    @Test
    void everyListTest() {
        System.out.println("everyList: " + service.everyBoardList());
    }

    @Test
    void specificList() {
        System.out.println("specific list: " + service.specificBoardList("질문"));
    }
}
