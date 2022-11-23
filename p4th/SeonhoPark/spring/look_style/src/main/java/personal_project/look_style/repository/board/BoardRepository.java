package personal_project.look_style.repository.board;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import personal_project.look_style.entity.board.Board;

import java.util.List;

public interface BoardRepository extends JpaRepository<Board, Long> {

    @Query("select b from Board b where b.boardType = :boardType")
    List<Board> findBoardsByBoardType(Sort sort, @Param("boardType") String boardType);

    @Query("select b from Board b where b.writer = :writer")
    List<Board> findBoardsByWriter(Sort sort, @Param("writer") String writer);
}
