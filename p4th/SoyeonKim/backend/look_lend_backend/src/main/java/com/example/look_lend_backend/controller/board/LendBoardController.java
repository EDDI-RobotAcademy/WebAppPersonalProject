package com.example.look_lend_backend.controller.board;

import com.example.look_lend_backend.entity.board.LendBoard;
import com.example.look_lend_backend.service.board.LendBoardService;
import com.example.look_lend_backend.service.board.request.LendBoardRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/lendBoard")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class LendBoardController {

    @Autowired
    private LendBoardService lendBoardService;


    @GetMapping("/list")
    public List<LendBoard> lendList () {
        log.info("lendList()");

        return lendBoardService.list();
    }

    @PostMapping("/register")
    public void lendRegister (@RequestBody LendBoardRequest lendBoardRequest) {
        log.info("lendRegister()");

        lendBoardService.register(lendBoardRequest);
    }

    @GetMapping("/{lendNo}")
    public LendBoard lendRead (@PathVariable("lendNo") Long lendNo) {
        log.info("lendRead()");

        return lendBoardService.read(lendNo);
    }

    @DeleteMapping("/{lendNo}")
    public void lendRemove (@PathVariable("lendNo") Long lendNo) {
        log.info("lendRemove()");

        lendBoardService.remove(lendNo);
    }

    @PutMapping("/{lendNo}")
    public LendBoard lendModify (@PathVariable("lendNo") Long lendNo, @RequestBody LendBoard lendBoard) {
        log.info("lendModify()");

        lendBoard.setLendNo(lendNo);
        lendBoardService.modify(lendBoard);

        return lendBoard;
    }

}
