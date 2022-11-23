package com.example.backend.repository;

import com.example.backend.entity.board.Board;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BoardRepository extends JpaRepository<Board, Long> {

    @Query("select b from Board b join b.boardCategory tb where tb.categoryId = :categoryId")
    List<Board> findAllBoardsByCategoryId(@Param("categoryId")Long categoryId, Sort sort);

    @Query("select b from Board b join b.member tb where tb.Id = :memberId")
    List<Board> findAllBoardsByMemberId(@Param("memberId")Long memberId, Sort sort);

}
