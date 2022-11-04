package kr.pjj.demo.repository.boards.exercise;

import kr.pjj.demo.entity.boards.exercise.Diary;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DiaryRepository extends JpaRepository<Diary, Long> {
    // 기본 리스트 조회 시에는 아래 코드 없음 -> 검색을 위한 것
    List<Diary> findByTitleOrWriterOrContent(String title, String writer, String content);
}
