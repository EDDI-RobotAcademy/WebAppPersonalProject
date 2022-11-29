package kr.eddi.demo.repository.board;


import kr.eddi.demo.entity.jpa.boards.QuestionBoard;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionBoardRepository extends JpaRepository<QuestionBoard, Long> {
}
