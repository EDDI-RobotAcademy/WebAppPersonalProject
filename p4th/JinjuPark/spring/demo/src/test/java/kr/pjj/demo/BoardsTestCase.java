package kr.pjj.demo;

import kr.pjj.demo.entity.boards.exercise.Comment;
import kr.pjj.demo.entity.boards.exercise.Diary;
import kr.pjj.demo.entity.boards.exercise.Recommend;
import kr.pjj.demo.repository.boards.exercise.CommentRepository;
import kr.pjj.demo.repository.boards.exercise.DiaryRepository;
import kr.pjj.demo.repository.boards.exercise.RecommendRepository;
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

    @Test
    void createBoard() {
        Diary diary = new Diary( "diary", "오운완", "wow", "public", "wow");
        diaryRepository.save(diary);
    }

    @Test
    void createDiary() {
        Diary diary = new Diary( "diary", "즐거운 홈트", "wow", "공개", "홈트 같이 해요");
        diaryRepository.save(diary);
    }

    @Test
    void findDiaryList () {
        List<Diary> diaryList = diaryRepository.findByTitleContainingOrWriterContainingOrContentContaining("wow", "wow", "wow");

        System.out.println(diaryList);
    }
    @Test
    void readDiary(){
        Optional<Diary> maybeDiary = diaryRepository.findById((long) 1);
        Diary diary = maybeDiary.get();
        diaryRepository.save(diary);
        System.out.println(diary);

    }
}
