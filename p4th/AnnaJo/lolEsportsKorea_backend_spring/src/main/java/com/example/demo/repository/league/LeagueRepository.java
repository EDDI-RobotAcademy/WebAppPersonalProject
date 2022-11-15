package com.example.demo.repository.league;

import com.example.demo.entity.league.League;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface LeagueRepository extends JpaRepository<League, Long> {
}
