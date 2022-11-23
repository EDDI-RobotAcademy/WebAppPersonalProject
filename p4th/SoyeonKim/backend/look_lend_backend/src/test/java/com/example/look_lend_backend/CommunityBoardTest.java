package com.example.look_lend_backend;

import com.example.look_lend_backend.entity.board.CommunityBoard;
import com.example.look_lend_backend.repository.board.CommunityBoardRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Sort;

import java.util.List;

@SpringBootTest
public class CommunityBoardTest {
    @Autowired
    CommunityBoardRepository repository;

    @Test
    public void communitymodify () {
        List<CommunityBoard> communityBoardList = repository.findAll(Sort.by(Sort.Direction.DESC,"boardNo"));
        System.out.println("service.list() : " + communityBoardList);
    }
}
