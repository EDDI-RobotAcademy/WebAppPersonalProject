package com.example.demo.repository.image;

import com.example.demo.entity.board.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface ImageListRepository extends JpaRepository<Image, Long> {

    @Query("select m from Image m join m.recipe r where r.recipeNo = :recipeNo")
    List<Image> findAllImagesByRecipeNo(Long recipeNo);
}
