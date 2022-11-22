package personal_project.look_style.repository.board;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import personal_project.look_style.entity.board.BoardImage;

import java.util.List;

public interface BoardImageRepository extends JpaRepository<BoardImage, Long> {

    @Query("select bi from BoardImage bi join bi.board b where b.boardNo = :boardNo")
    List<BoardImage> findAllBoardImagesByBoardId(@Param("boardNo") Long boardNo);
}
