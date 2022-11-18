package com.example.demo.controller.league;

import com.example.demo.entity.league.League;
import com.example.demo.service.League.LeagueService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/league")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class LeagueInfoController {

    @Autowired
    private LeagueService service;

    /**
     * 경기 정보 리스트를 반환하는 메서드
     * @return League DB에 저장되어있는 경기 일정
     */
    @GetMapping("/list")
    public List<League> leagueList () {
        log.info("leagueList()");

        return service.list();
    }
}
