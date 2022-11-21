package com.example.demo.repository.recipe;

import com.example.demo.entity.board.Recipe;
import com.example.demo.entity.member.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface RecipeRepository extends JpaRepository<Recipe, Long> {

    @Query("select r from Recipe r where r.title = :title and r.writer = :writer and r.content = :content")
    Optional<Recipe> findBySeveralOption(String title, String writer, String content);

}
