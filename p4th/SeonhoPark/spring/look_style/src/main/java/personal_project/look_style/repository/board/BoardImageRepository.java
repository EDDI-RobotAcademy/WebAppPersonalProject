package personal_project.look_style.repository.board;

import org.springframework.data.jpa.repository.JpaRepository;
import personal_project.look_style.entity.board.BoardImage;

public interface BoardImageRepository extends JpaRepository<BoardImage, Long> {
}
