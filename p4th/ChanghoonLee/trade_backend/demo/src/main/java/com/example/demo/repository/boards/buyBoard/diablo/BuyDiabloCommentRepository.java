package com.example.demo.repository.boards.buyBoard.diablo;

import com.example.demo.entity.boards.buyBoard.diablo.BuyDiabloComment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface BuyDiabloCommentRepository extends JpaRepository<BuyDiabloComment, Long> {

    @Query("select c from BuyDiabloComment c join c.buyDiabloBoard n where n.buyDiabloNo = :buyDiabloNo")
    List<BuyDiabloComment> findAllByBoardId(Long buyDiabloNo);
}
