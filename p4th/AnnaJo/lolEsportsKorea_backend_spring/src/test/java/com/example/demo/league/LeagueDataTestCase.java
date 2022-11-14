package com.example.demo.league;

import com.example.demo.entity.league.League;
import com.example.demo.repository.league.LeagueRepository;
import com.example.demo.service.League.LeagueService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Sort;

import java.util.List;

@SpringBootTest
public class LeagueDataTestCase {

    @Autowired
    LeagueRepository repository;

    @Test
    public void leagueList () {
        List<League> leagueList = repository.findAll(Sort.by(Sort.Direction.DESC, "id"));
        System.out.println("service.list()" + leagueList );
    }

}
