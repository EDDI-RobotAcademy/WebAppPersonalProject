package com.example.backend.repository;

import com.example.backend.entity.board.Board;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BoardRepository extends JpaRepository<Board, Long> {

    @Query("select b from Board b join b.boardCategory tb where tb.categoryId = :categoryId")
    List<Board> findAllBoardsByCategoryId(Long categoryId, Sort sort);

}
