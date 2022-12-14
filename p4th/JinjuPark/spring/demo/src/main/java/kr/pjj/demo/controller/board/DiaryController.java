package kr.pjj.demo.controller.board;

import kr.pjj.demo.controller.board.request.DiaryModify;
import kr.pjj.demo.controller.board.request.DiaryRequest;
import kr.pjj.demo.entity.board.Diary;
import kr.pjj.demo.service.board.DiaryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("hometwang/boards/diary")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
class DiaryController {

    @Autowired
    private DiaryService service;

    @GetMapping("/list/{pageNo}")
    public List<Diary> diaryList (@PathVariable("pageNo") Long pageNo, String keyword) {
        // 기본 리스트 조회+ 키워드 있으면 검색해서 전달
        log.info("페이지 넘버: "+ pageNo);
        log.info("검색키워드: "+keyword);

        // 경우의 수
        // 1) 전체검색 :  page 0, 키워드 있음
        // 2) 게시판별 검색 : page 1~3, 키워드 있음
        // 3) 게시판 리스트 출력 : page 1~3, 키워드 없음

        if (keyword == null|| keyword.length() == 0){
            log.info("다이어리 리스트 조회 메소드 실행");
            if(pageNo == 0){
                return service.AllList();
            } else{
                return service.pageDiaryList(pageNo);
            }
        } else {
                log.info("다이어리 리스트 검색 메소드 실행"+ keyword);
                return service.search(pageNo, keyword);
            }
    }

    @GetMapping("/mylist/{memberId}")
    public List<Diary> myDiaryList (@PathVariable("memberId") Long memberId) {
        log.info("마이 다이어리 멤버아이디: "+ memberId);
            return service.MyDiaryList(memberId);
    }

    //이미지 없이 게시글 등록
    @PostMapping("/register")
    public void diaryRegister (@RequestBody DiaryRequest diaryRequest) {
        log.info("다이어리 게시글 등록");

        service.register(diaryRequest);
    }


    //이미지 업로드 게시글 등록
    @ResponseBody
    @PostMapping(value = "/registerWithFiles",
            consumes = { MediaType.MULTIPART_FORM_DATA_VALUE, MediaType.APPLICATION_JSON_VALUE }) // 이미지+텍스트 업로드하는 경우 value , consumes 정보(이미지타입, json타입) 추가
    public String diaryRegisterWithFiles (
            @RequestPart(value = "fileList") List<MultipartFile> fileList,
            @RequestPart(value = "info") DiaryRequest diaryRequest) {

        log.info("requestUploadFilesWithText(): " + fileList.toString());
        log.info("requestUploadFilesWithText(): " + diaryRequest);

        service.registerWithFiles(fileList, diaryRequest);

        return "게시글이 등록되었습니다.";
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
    public Diary diaryModify (@PathVariable("boardNo") Long boardNo, @RequestBody DiaryModify diaryModify) {
        log.info("다이어리 수정 ");
        return service.modify(diaryModify);
    }

}
