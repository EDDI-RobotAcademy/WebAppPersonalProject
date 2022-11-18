package com.example.backend;

import com.example.backend.entity.board.Board;
import com.example.backend.entity.board.BoardCategory;
import com.example.backend.repository.BoardCategoryRepository;
import com.example.backend.repository.BoardRepository;
import com.example.backend.service.board.request.BoardRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

@SpringBootTest
public class BoardRegisterTest {

    @Autowired
    private BoardCategoryRepository categoryRepository;

    @Autowired
    private BoardRepository boardRepository;

    @Test
    void createCategory () {
        BoardCategory category = new BoardCategory("자유");

        categoryRepository.save(category);
    }

    @Test
    void registerBoard() {
        BoardRequest boardRequest = new BoardRequest("두번째 게시물", "랄라", "오디보자", "자유");

        Optional<BoardCategory> maybeCategory = categoryRepository.findByCategoryName(boardRequest.getBoardCategoryName());
        BoardCategory categoryReq = maybeCategory.get();

        System.out.println(maybeCategory.get().getCategoryName());

        Board board = boardRequest.toBoard();

        categoryReq.setBoard(board);

        board.setTitle(boardRequest.getTitle());
        board.setContent(boardRequest.getContent());
        board.setWriter(boardRequest.getWriter());

        boardRepository.save(board);
    }
}
