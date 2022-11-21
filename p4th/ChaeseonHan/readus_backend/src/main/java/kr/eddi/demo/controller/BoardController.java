package kr.eddi.demo.controller;


import kr.eddi.demo.controller.form.BoardModifyForm;
import kr.eddi.demo.controller.form.BoardWriteForm;
import kr.eddi.demo.entity.CommunityBoard;
import kr.eddi.demo.service.BoardServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/board")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class BoardController {

    @Autowired
    BoardServiceImpl service;

    @PostMapping("/write")
    public Boolean writeBoard(@RequestBody BoardWriteForm boardWriteForm) {
        return service.write(boardWriteForm.toBoardWriteRequest());
    }


    // TODO: 2022.11.11 우선 읽기 수정 기능 구현하기 위해서 먼저 findAll로 가져오게 함! 수정 필요
    @GetMapping("/list-temporary")
    public List<CommunityBoard> readList() {
        return service.temporaryBoardList();
    }


    // TODO: 2022.11.10 페이징으로 게시판 리스트 구현하려는데 감이 안잡힌다
    @GetMapping("/list-view")
    public String readAllPost() {
        return null;
    }

    @GetMapping("/read/{boardNo}")
    public CommunityBoard read(@PathVariable("boardNo") Long boardNo) {

        return service.read(boardNo);
    }

    @PutMapping("/modify/{boardNo}")
    public Boolean modifyBoard(@PathVariable("boardNo") Long boardNo, @RequestBody BoardModifyForm modifyForm) {
        return service.modify(boardNo, modifyForm);
    }

    @DeleteMapping("/delete/{boardNo}")
    public Boolean deleteBoard(@PathVariable("boardNo") Long boardNo) {
        return service.delete(boardNo);
    }

    @GetMapping("/category/{category}")
    public List<CommunityBoard> readCategoryList(@PathVariable("category") String category) {
        return service.categoryBoardList(category);
    }

}
