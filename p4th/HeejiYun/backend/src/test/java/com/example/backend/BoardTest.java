package com.example.backend;

import com.example.backend.entity.board.Board;
import com.example.backend.service.board.BoardService;
import com.example.backend.service.board.request.BoardModifyRequest;
import com.example.backend.service.board.request.BoardRegisterRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
public class BoardTest {
    @Autowired
    BoardService service;

    @Test
    void registerTest() {
        BoardRegisterRequest boardRegisterRequest =
                new BoardRegisterRequest("정숙이 원맨쇼", "정숙", "히히", "질문");

        service.register(boardRegisterRequest);
    }

    @Test
    void everyListTest() {
        service.everyBoardList();
    }

    @Test
    void specificList() {
        service.specificBoardList("질문");
    }

    @Test
    void readTest() {
        Long BoardNo = Long.valueOf(1);
        service.read(BoardNo);
    }

    @Test
    void modifyTest() {
        Long BoardNo = Long.valueOf(1);
        BoardModifyRequest modifyRequest = new BoardModifyRequest("수정테스트", "이야아!!!");

        service.modify(BoardNo, modifyRequest);
    }

    @Test
    void removeTest() {
        Long BoardNo = Long.valueOf(1);
        service.remove(BoardNo);
    }
}
