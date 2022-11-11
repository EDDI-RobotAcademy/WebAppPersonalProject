package kr.eddi.demo.controller;


import kr.eddi.demo.controller.form.BoardWriteForm;
import kr.eddi.demo.entity.CommunityBoard;
import kr.eddi.demo.service.BoardServiceImpl;
import kr.eddi.demo.service.MemberServiceImpl;
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
    MemberServiceImpl memberService;

    @Autowired
    BoardServiceImpl boardService;

    @PostMapping("/write")
    public Boolean writeBoard(@RequestBody BoardWriteForm boardWriteForm){
        return boardService.write(boardWriteForm.toBoardWriteRequest());
    }


    // TODO: 2022.11.11 우선 읽기 수정 기능 구현하기 위해서 먼저 findAll로 가져오게 함! 수정 필요
    @GetMapping("/list-temporary")
    public List<CommunityBoard> readList() {
        return boardService.temporaryBoardList();
    }


    // TODO: 2022.11.10 페이징으로 게시판 리스트 구현하려는데 감이 안잡힌다
    @GetMapping("/list-view")
    public String readAllPost(){
        return null;
    }
}
