package com.example.look_lend_backend.repository.board;

import com.example.look_lend_backend.entity.board.CommunityBoard;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommunityBoardRepository extends JpaRepository<CommunityBoard, Long> {
}
