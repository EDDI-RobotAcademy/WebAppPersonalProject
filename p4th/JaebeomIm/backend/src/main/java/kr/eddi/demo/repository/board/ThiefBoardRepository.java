package kr.eddi.demo.repository.board;


import kr.eddi.demo.entity.jpa.boards.ThiefBoard;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ThiefBoardRepository extends JpaRepository<ThiefBoard, Long> {
}
