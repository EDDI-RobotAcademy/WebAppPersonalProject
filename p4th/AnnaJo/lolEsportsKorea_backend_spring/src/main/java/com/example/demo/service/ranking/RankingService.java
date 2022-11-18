package com.example.demo.service.ranking;

import com.example.demo.entity.ranking.TeamRanking;

import java.util.List;

public interface RankingService {
    public List<TeamRanking> getFindRankingList(String requestRanking);
}
