package com.example.demo.service.ranking;

import com.example.demo.entity.ranking.TeamRanking;
import com.example.demo.repository.ranking.TeamRankingRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class RankingServiceImpl implements RankingService{

    @Autowired
    TeamRankingRepository teamRankingRepository;

    @Override
    public List<TeamRanking> getFindRankingList(String requestRanking) {
        return teamRankingRepository.findTeamRankingBySeasonTitleContaining(requestRanking);
    }
}
