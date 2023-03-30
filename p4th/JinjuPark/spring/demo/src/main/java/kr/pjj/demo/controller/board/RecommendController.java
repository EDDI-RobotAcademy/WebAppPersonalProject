package kr.pjj.demo.controller.board;

import kr.pjj.demo.controller.board.request.ThumbUpDown;
import kr.pjj.demo.service.board.RecommendService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("hometwang/boards/diary")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class RecommendController {

    @Autowired
    private RecommendService service;

    @PostMapping("/recommend")
    public List<Integer> diaryThumbUpDown (@RequestBody ThumbUpDown thumbUpDown) {
        log.info("다이어리 추천_비추천 메소드 실행- 게시물번호: "+ thumbUpDown.getBoardNo());
        Long memberId = thumbUpDown.getMemberId();
        Long boardNo = thumbUpDown.getBoardNo();
        String thumbType = thumbUpDown.getThumbType();

        return service.recommendUpDown(memberId, boardNo, thumbType);
    }

    @GetMapping("/recommend/{boardNo}")
    public List<Integer> diaryThumbStatus (@PathVariable("boardNo") Long boardNo) {
        log.info("다이어리 추천수 Read()");

        return service.recommendStatus(boardNo);
    }
}
