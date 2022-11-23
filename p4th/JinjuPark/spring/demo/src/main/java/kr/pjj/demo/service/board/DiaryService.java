package kr.pjj.demo.service.board;

import kr.pjj.demo.controller.board.request.DiaryModify;
import kr.pjj.demo.controller.board.request.DiaryRequest;
import kr.pjj.demo.entity.board.Diary;

import java.util.List;

public interface DiaryService {
    public List<Diary> pageDiaryList(Long pageNo);

    public List<Diary> AllList();

    public void register(DiaryRequest diaryRequest);

    //검색
    public List<Diary> search(Long pageNo, String keyword);

    public Diary read(Long boardNo);

    public Diary modify(DiaryModify diaryModify);
    public void remove(Long boardNo);
}
