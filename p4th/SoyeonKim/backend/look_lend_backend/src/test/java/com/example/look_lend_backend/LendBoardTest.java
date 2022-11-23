package com.example.look_lend_backend;

import com.example.look_lend_backend.entity.board.LendBoard;
import com.example.look_lend_backend.repository.board.LendBoardRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class LendBoardTest {
    @Autowired
    private LendBoardRepository lendBoardRepository;

}
