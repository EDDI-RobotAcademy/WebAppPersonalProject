package kr.eddi.demo.repository.board;


import kr.eddi.demo.entity.jpa.boards.GradeUpBoard;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GradeUpBoardRepository extends JpaRepository<GradeUpBoard, Long> {
}
