package kr.eddi.demo.repository.board;

import kr.eddi.demo.entity.jpa.boards.Board;
import kr.eddi.demo.entity.jpa.boards.FreeBoard;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface FreeBoardRepository extends JpaRepository<FreeBoard, Long> {
    List<FreeBoard> findByTitleContaining(String keyword);
}
