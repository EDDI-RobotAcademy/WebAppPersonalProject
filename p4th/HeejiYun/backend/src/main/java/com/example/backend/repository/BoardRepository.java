package com.example.backend.repository;

import com.example.backend.entity.board.Board;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BoardRepository extends JpaRepository<Board, Long> {
    // 왜 categoryid로 되어있는가?? 아 이게 column명이 아니고 엔티티 필드명이네?
    @Query("select b from Board b join b.boardCategory tb where tb.categoryId = :categoryId")
    List<Board> findAllBoardsByCategoryId(Long categoryId, Sort sort);

    @Query("select b from Board b join b.member tb where tb.Id = :memberId")
    List<Board> findAllBoardsByMemberId(Long memberId, Sort sort);

}
