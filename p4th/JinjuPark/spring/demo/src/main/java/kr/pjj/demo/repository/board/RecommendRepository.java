package kr.pjj.demo.repository.board;

import kr.pjj.demo.entity.board.Recommend;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface RecommendRepository extends JpaRepository<Recommend, Long> {

    //JPQL
    @Query("select r from Recommend r join fetch r.diary join fetch r.member where r.diary.boardNo = :board_id and r.member.id= :member_id")
    Optional<Recommend> findByDiaryAndMember(Long board_id, Long member_id);

    @Query("select r from Recommend r join fetch r.diary dy where dy.boardNo = :boardNo")
    List<Recommend> findAllRecommendsByBoardId(Long boardNo);
}