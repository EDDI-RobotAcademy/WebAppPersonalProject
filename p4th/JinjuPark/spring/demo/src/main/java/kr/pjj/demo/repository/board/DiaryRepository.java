package kr.pjj.demo.repository.board;

import kr.pjj.demo.entity.board.Diary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import java.util.List;


public interface DiaryRepository extends JpaRepository<Diary, Long> {

    //전체 게시판 리스트 출력(공개글)
    @Query("select d from Diary d order by d.boardNo desc ")
    List<Diary> findDiaryByPublicBoardNoDesc();


    //전체 검색창(공개글)
    @Query("select d from Diary d where (d.title like %:title% or d.content like %:content%) order by d.boardNo desc")
    List<Diary> findDiaryByPublicAndTitleContaining(String title, String content);



    // 페이지별 게시판 리스트 출력(공개글)
    @Query("select d from Diary d join d.category dc where dc.pageNo = :pageNo order by d.boardNo desc ")
    List<Diary> findDiaryByPublicAndPageNoOrderByBoardNoDesc(Long pageNo);


    // 페이지 게시판 검색 (공개글)
    @Query("select d from Diary d where d.category.pageNo = :pageNo and (d.title like %:title% or d.content like %:content%) order by d.boardNo desc")
    List<Diary> findDiaryByPageNoAndTitleContaining(Long pageNo, String title, String content);


}
