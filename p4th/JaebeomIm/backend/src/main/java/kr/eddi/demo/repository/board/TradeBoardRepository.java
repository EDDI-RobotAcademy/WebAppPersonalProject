package kr.eddi.demo.repository.board;

import kr.eddi.demo.entity.jpa.boards.QuestionBoard;
import kr.eddi.demo.entity.jpa.boards.TradeBoard;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TradeBoardRepository extends JpaRepository<TradeBoard, Long> {
}
