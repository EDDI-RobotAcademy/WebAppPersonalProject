package kr.pjj.demo;

import kr.pjj.demo.entity.boards.exercise.Diary;
import kr.pjj.demo.repository.boards.exercise.DiaryRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class BoardsTestCase {

    @Autowired
    private DiaryRepository diaryRepository;

    @Test
    void createBoard() {
        Diary diary = new Diary( "diary", "오운완", "wow", "public", "wow");

        diaryRepository.save(diary);
    }

}
