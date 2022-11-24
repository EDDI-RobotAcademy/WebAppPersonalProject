package com.example.demo.repository.boards.sellBoard.baram;

import com.example.demo.entity.boards.sellBoard.baram.SellBaramComment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SellBaramCommentRepository extends JpaRepository<SellBaramComment, Long> {

    @Query("select c from SellBaramComment c join c.sellBaramBoard n where n.sellBaramNo = :sellBaramNo")
    List<SellBaramComment> findAllByBoardId(Long sellBaramNo);
}
