package com.example.demo.repository.ranking;

import com.example.demo.entity.ranking.TeamRanking;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TeamRankingRepository extends CrudRepository<TeamRanking, Long> {
    List<TeamRanking> findTeamRankingBySeasonTitleContaining(String searchKeyword);
}
