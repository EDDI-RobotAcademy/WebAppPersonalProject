package kr.pjj.demo;

import kr.pjj.demo.entity.board.Comment;
import kr.pjj.demo.entity.board.Diary;
import kr.pjj.demo.entity.board.Recommend;
import kr.pjj.demo.repository.board.*;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Optional;

@SpringBootTest
public class BoardsTestCase {

    @Autowired
    private DiaryRepository diaryRepository;

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private RecommendRepository recommendRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Test
    void createBoard() {
        Diary diary = new Diary(  "오운완",  "공개", "wow");
        diaryRepository.save(diary);
    }

    @Test
    void createDiary() {
        Diary diary = new Diary(  "즐거운 홈트", "공개", "홈트 같이 해요");
        diaryRepository.save(diary);
    }

    @Test
    void findDiaryList () {
        List<Diary> diaryList = diaryRepository.findDiaryByPublicAndTitleContaining("wow",  "wow");

        System.out.println(diaryList);
    }

    @Test
    void readDiary(){
        Optional<Diary> maybeDiary = diaryRepository.findById((long) 1);
        Diary diary = maybeDiary.get();
        diaryRepository.save(diary);
        System.out.println(diary);
    }
    @Test
    void modifyDiary () {
        Optional<Diary> maybeDiary = diaryRepository.findById((long) 8);
        Diary diary = maybeDiary.get();

        diary.modifyDiary("기초대사량 전격 분석", "work out!!");
        diaryRepository.save(diary);
        System.out.println(diary);
    }

    @Test
    void deleteDiary(){
        diaryRepository.deleteById((long) 9);
    }

    // 게시글 삭제 위해서는 해당 게시글의 모든 댓글 먼저 삭제 되어야
    @Test
    void deleteBoard () {
        Long boardNo = 1L;
        List<Comment> commentList = commentRepository.findAllCommentsByBoardId(boardNo);

        for (Comment comment : commentList) {
            commentRepository.delete(comment);
        }

        List<Recommend> recommendList = recommendRepository.findAllRecommendsByBoardId(boardNo);

        for (Recommend recommend : recommendList){
            recommendRepository.delete(recommend);
        }

        diaryRepository.deleteById(boardNo);
        categoryRepository.deleteById(boardNo); // 다이어리 먼저 지우고 카테고리 지워야 함

        diaryRepository.deleteById(boardNo);
    }


    //검색기능- 전체 + 페이지 검색
    @Test
    void searchDiaryList() {
        List<Diary> searchPageList = null;
        Long pageNo = 1L;
        String keyword = "홈트";
        if (pageNo == 0) {
            searchPageList = diaryRepository.findDiaryByPublicAndTitleContaining(keyword, keyword);
        } else if (pageNo == 1) {
            searchPageList = diaryRepository.findDiaryByPageNoAndTitleContaining(pageNo, keyword, keyword);
        } else if (pageNo == 2) {
            searchPageList = diaryRepository.findDiaryByPageNoAndTitleContaining(pageNo, keyword, keyword);
        } else if (pageNo == 3) {
            searchPageList = diaryRepository.findDiaryByPageNoAndTitleContaining(pageNo, keyword, keyword);
        }
        System.out.println(searchPageList);
    }

}
