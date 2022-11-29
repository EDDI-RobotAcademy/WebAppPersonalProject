package kr.eddi.demo.repository.board;

import kr.eddi.demo.entity.jpa.boards.WarriorBoard;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WarriorBoardRepository extends JpaRepository<WarriorBoard, Long> {
}
