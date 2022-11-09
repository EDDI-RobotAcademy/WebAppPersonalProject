package kr.pjj.demo;

import kr.pjj.demo.entity.boards.exercise.Diary;
import kr.pjj.demo.repository.boards.exercise.DiaryRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class BoardsTestCase {

    @Autowired
    private DiaryRepository diaryRepository;

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
}
