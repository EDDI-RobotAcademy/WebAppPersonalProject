package kr.pjj.demo.controller.board;

import kr.pjj.demo.service.board.ImageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("hometwang/boards/diary/images")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class ImageController {

    @Autowired
    private ImageService service;

    @GetMapping("/{boardNo}")
    public List<String> imagesRead (@PathVariable("boardNo") Long boardNo) {
        log.info("게시판 이미지 Read()");

        return service.read(boardNo);
    }


}
