package com.example.demo.ranking;

import com.example.demo.entity.comment.Comment;
import com.example.demo.service.comment.CommentService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class TeamRankingListTestCase {

    @Autowired
    private CommentService service;

    @Test
    public void teamRankingList () {
        System.out.println("teamRankingList()");
        List<Comment> teamCommentList = service.getTeamCommentList("T1");
        System.out.println("teamCommentList:" + teamCommentList);
    }
}
