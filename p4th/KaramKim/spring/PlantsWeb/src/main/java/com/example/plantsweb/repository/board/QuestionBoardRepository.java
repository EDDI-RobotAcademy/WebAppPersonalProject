package com.example.plantsweb.repository.board;

import com.example.plantsweb.entity.board.QuestionBoard;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionBoardRepository extends JpaRepository<QuestionBoard, Long> {
}
