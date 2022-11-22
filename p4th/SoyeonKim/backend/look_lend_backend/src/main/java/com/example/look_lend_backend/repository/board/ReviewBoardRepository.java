package com.example.look_lend_backend.repository.board;

import com.example.look_lend_backend.entity.board.ReviewBoard;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReviewBoardRepository extends JpaRepository<ReviewBoard, Long> {
}
