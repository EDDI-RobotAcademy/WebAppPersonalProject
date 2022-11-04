package kr.pjj.demo.controller.member.boards.exercise;

import kr.pjj.demo.entity.boards.exercise.Diary;
import kr.pjj.demo.service.boards.exercise.DiaryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("hometwang/boards/diary")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
class DiaryController {

    @Autowired
    private DiaryService service;

    @GetMapping("/list")
    public List<Diary> diaryList (String keyword) {   // 기본 리스트 조회에는 파라미터 String keyword 없음
        // 기본 리스트 조회
//        return service.list();
        if (keyword == null){
            log.info("다이어리 리스트 조회 메소드 실행");
            return service.list();

        } else {
            log.info("다이어리 리스트 검색 메소드 실행");
            return service.search(keyword);

        }
    }

}
