package kr.eddi.demo.controller;


import kr.eddi.demo.controller.form.BoardWriteForm;
import kr.eddi.demo.service.BoardServiceImpl;
import kr.eddi.demo.service.MemberServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
}
