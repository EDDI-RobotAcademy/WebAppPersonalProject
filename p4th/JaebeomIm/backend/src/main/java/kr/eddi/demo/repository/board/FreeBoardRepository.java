package kr.eddi.demo.repository.board;

import kr.eddi.demo.entity.jpa.boards.Board;
import kr.eddi.demo.entity.jpa.boards.FreeBoard;
import org.springframework.data.jpa.repository.JpaRepository;


public interface FreeBoardRepository extends JpaRepository<FreeBoard, Long> {
}
