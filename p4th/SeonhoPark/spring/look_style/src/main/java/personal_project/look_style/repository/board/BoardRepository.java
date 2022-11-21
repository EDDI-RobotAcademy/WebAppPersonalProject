package personal_project.look_style.repository.board;

import org.springframework.data.jpa.repository.JpaRepository;
import personal_project.look_style.entity.board.Board;

public interface BoardRepository extends JpaRepository<Board, Long> {

}
