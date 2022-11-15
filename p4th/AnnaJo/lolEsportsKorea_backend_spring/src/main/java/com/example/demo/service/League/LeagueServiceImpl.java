package com.example.demo.service.League;

import com.example.demo.entity.league.League;
import com.example.demo.repository.league.LeagueRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class LeagueServiceImpl implements LeagueService{

    @Autowired
    LeagueRepository repository;

    @Override
    public List<League> list() {
        return repository.findAll(Sort.by(Sort.Direction.DESC, "id"));
    }


}
