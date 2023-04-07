package kr.pjj.demo.repository.board;

import kr.pjj.demo.entity.board.Diary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import java.util.List;
import java.util.Optional;


public interface DiaryRepository extends JpaRepository<Diary, Long> {

    @Query("select d from Diary d join fetch d.category dc join fetch d.member dm where d.boardNo= :boardNo")
    Optional<Diary> findByDiaryId(Long boardNo);

    //전체 게시판 리스트 출력(공개글)
    @Query("select d from Diary d join fetch d.category dc join fetch d.member dm where d.authority= '공개' order by d.boardNo desc ")
    List<Diary> findDiaryByPublicBoardNoDesc();


    //전체 검색창(공개글)
    @Query("select d from Diary d join fetch d.category dc join fetch d.member dm where d.authority= '공개' and (d.title like %:title% or d.content like %:content%) order by d.boardNo desc")
    List<Diary> findDiaryByPublicAndTitleContaining(String title, String content);



    // 페이지별 게시판 리스트 출력(공개글)
    @Query("select d from Diary d join fetch d.category dc join fetch d.member dm where d.authority= '공개' and dc.pageNo = :pageNo order by d.boardNo desc ")
    List<Diary> findDiaryByPublicAndPageNoOrderByBoardNoDesc(Long pageNo);


    // 페이지 게시판 검색 (공개글)
    @Query("select d from Diary d join fetch d.category dc join fetch d.member dm where d.authority= '공개' and d.category.pageNo = :pageNo and (d.title like %:title% or d.content like %:content%) order by d.boardNo desc")
    List<Diary> findDiaryByPageNoAndTitleContaining(Long pageNo, String title, String content);

    // 마이페이지 리스트 출력 (공개 + 비공개글)
    @Query("select d from Diary d join fetch d.category dc join fetch d.member dm where d.member.id = :memberId order by d.boardNo desc ")
    List<Diary> findMyDiaryByMemberIdOrderByBoardNoDesc(Long memberId);


}
