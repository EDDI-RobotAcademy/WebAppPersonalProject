package kr.eddi.demo.repository;

import kr.eddi.demo.entity.CommunityBoard;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;


public interface CommunityBoardRepository extends JpaRepository<CommunityBoard, Long> {

    @Query("select b from CommunityBoard b join fetch b.comments where b.boardNo = :boardNo")
    Optional<CommunityBoard> findByIdWithComments(Long boardNo);

    List<CommunityBoard> findByContentsContainingIgnoreCaseOrTitleContainingIgnoreCase(String title, String contents, Sort sort);

    List<CommunityBoard> findByTitleContainingIgnoreCase(String title, Sort sort);

    List<CommunityBoard> findByContentsContainingIgnoreCase(String contents, Sort sort);

    List<CommunityBoard> findByWriterContainingIgnoreCase(String writer, Sort sort);
}
