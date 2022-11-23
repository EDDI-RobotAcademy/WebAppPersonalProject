package com.example.demo.controller.ranking;

import com.example.demo.entity.ranking.TeamRanking;
import com.example.demo.service.ranking.RankingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/ranking")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class TeamRankingController {

    @Autowired
    private RankingService service;

    /**
     * 시즌 별 팀 랭킹 정보를 반환하는 메서드
     * @param seasonTitle 시즌 타이틀
     * @return 요청 온 시즌의 정보 List
     */
    @GetMapping("/{seasonTitle}")
    public List<TeamRanking> teamRankingList (@PathVariable("seasonTitle") String seasonTitle) {
        log.info("teamRankingList()");

        return service.getFindRankingList(seasonTitle);
    }
}
