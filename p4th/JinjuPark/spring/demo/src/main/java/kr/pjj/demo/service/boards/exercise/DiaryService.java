package kr.pjj.demo.service.boards.exercise;

import kr.pjj.demo.controller.member.boards.exercise.request.DiaryRequest;
import kr.pjj.demo.entity.boards.exercise.Diary;

import java.util.List;

public interface DiaryService {
    public List<Diary> list();

    public void register(DiaryRequest diaryRequest);

    //검색
    public List<Diary> search(String keyword);

    public Diary read(Long boardNo);

    public void modify(Diary diary);
    public void remove(Long boardNo);
}
