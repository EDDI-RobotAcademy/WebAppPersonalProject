package com.example.demo.repository.boards.sellBoard.diablo;

import com.example.demo.entity.boards.sellBoard.diablo.SellDiabloComment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface SellDiabloCommentRepository extends JpaRepository<SellDiabloComment, Long> {

    @Query("select c from SellDiabloComment c join c.sellDiabloBoard n where n.sellDiabloNo = :sellDiabloNo")
    List<SellDiabloComment> findAllByBoardId(Long sellDiabloNo);
}
