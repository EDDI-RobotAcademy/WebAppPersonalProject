package kr.pjj.demo.repository.boards.exercise;

import kr.pjj.demo.entity.boards.exercise.Diary;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.List;


public interface DiaryRepository extends JpaRepository<Diary, Long> {
    List<Diary> findByTitleContainingOrWriterContainingOrContentContaining(String title, String writer, String content);
}
