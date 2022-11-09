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
    public List<Diary> diaryList () {
        // 기본 리스트 조회
       return service.list();
    }

}
