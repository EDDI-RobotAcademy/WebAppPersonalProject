package kr.pjj.demo.service.boards.exercise;

import kr.pjj.demo.entity.boards.exercise.Diary;

import java.util.List;

public interface DiaryService {
    public List<Diary> list();

    //검색
    public List<Diary> search(String keyword);
}
