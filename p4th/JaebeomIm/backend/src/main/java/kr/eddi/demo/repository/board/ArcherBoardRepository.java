package kr.eddi.demo.repository.board;

import kr.eddi.demo.entity.jpa.boards.ArcherBoard;
import kr.eddi.demo.entity.jpa.boards.FreeBoard;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ArcherBoardRepository extends JpaRepository<ArcherBoard, Long> {
}
