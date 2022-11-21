package com.example.demo.comment;

import com.example.demo.entity.ranking.TeamRanking;
import com.example.demo.service.ranking.RankingService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class CommentListTestCase {

    @Autowired
    private RankingService service;

    @Test
    public void commentList () {
        System.out.println("commentList()");
        List<TeamRanking> teamRankingList = service.getFindRankingList("2022 LCK 스프링");
        System.out.println(teamRankingList);
    }
}
