package com.example.demo.repository.buyBoard.baram;

import com.example.demo.entity.boards.buyBoard.baram.BuyBaramComment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BuyBaramCommentRepository extends JpaRepository<BuyBaramComment, Long> {

    @Query("select c from BuyBaramComment c join c.buyBaramBoard n where n.buyBaramNo = :buyBaramNo")
    List<BuyBaramComment> findAllByBoardId(Long buyBaramNo);
}
