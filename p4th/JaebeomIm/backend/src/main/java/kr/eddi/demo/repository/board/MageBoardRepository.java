package kr.eddi.demo.repository.board;

import kr.eddi.demo.entity.jpa.boards.MageBoard;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MageBoardRepository extends JpaRepository<MageBoard, Long> {
}
