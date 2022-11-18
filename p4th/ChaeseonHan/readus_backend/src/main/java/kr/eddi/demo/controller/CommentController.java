package kr.eddi.demo.controller;

import kr.eddi.demo.controller.form.CommentModifyForm;
import kr.eddi.demo.controller.form.CommentToBoardForm;
import kr.eddi.demo.service.CommentServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@Slf4j
@RestController
@RequestMapping("/comment")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class CommentController {

    @Autowired
    CommentServiceImpl service;

    @PostMapping("/write/{boardNo}")
    public Boolean writeComment(@PathVariable("boardNo") Long boardNo,
                                @RequestBody CommentToBoardForm commentToBoardForm) {
        return service.write(commentToBoardForm.toCommentToBoardWriteRequest());
    }

    @PutMapping("/modify/{commentNo}")
    public Boolean modifyComment(@PathVariable("commentNo") Long commentNo, @RequestBody CommentModifyForm form) {
        return service.modify(commentNo, form.getModifiedComment());
    }

    @DeleteMapping("/delete/{commentNo}")
    public Boolean deleteComment(@PathVariable("commentNo") Long commentNo) {
        return service.delete(commentNo);
    }

}
