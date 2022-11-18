package kr.pjj.demo.controller.member.boards.exercise;

import kr.pjj.demo.controller.member.boards.exercise.request.DiaryRequest;
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
    public List<Diary> diaryList (String keyword) {
        // 기본 리스트 조회+ 키워드 있으면 검색해서 전달

        if (keyword == null){
            log.info("다이어리 리스트 조회 메소드 실행");
            return service.list();

        } else {
            log.info("다이어리 리스트 검색 메소드 실행"+ keyword);
            return service.search(keyword);

        }
    }

    @PostMapping("/register")
    public void diaryRegister (@RequestBody DiaryRequest diaryRequest) {
        log.info("다이어리 게시글 등록");

        service.register(diaryRequest);
    }

    @GetMapping("/{boardNo}")
    public Diary diaryRead (@PathVariable("boardNo") Long boardNo) {
        log.info("다이어리 Read()");

        return service.read(boardNo);
    }

    @DeleteMapping("/{boardNo}")
    public void diaryRemove (@PathVariable("boardNo") Long boardNo) {
        log.info("다이어리 삭제()");

        service.remove(boardNo);
    }

    @PutMapping("/{boardNo}")
    public Diary diaryModify (@PathVariable("boardNo") Long boardNo, @RequestBody Diary diary) {
        log.info("다이어리 수정 ");

        diary.setBoardNo(boardNo);

        service.modify(diary);
        log.info("서비스 수정 진행 했음");
        return diary;
    }

}
