package com.example.backend.repository;

import com.example.backend.entity.board.BoardCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface BoardCategoryRepository extends JpaRepository<BoardCategory, Long> {

    @Query("select c from BoardCategory c where c.categoryName = :categoryName")
    Optional<BoardCategory> findByCategoryName(@Param("categoryName")String categoryName);

}
