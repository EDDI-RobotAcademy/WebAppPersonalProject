package com.example.look_lend_backend.controller.board;

import com.example.look_lend_backend.entity.board.CommunityBoard;
import com.example.look_lend_backend.service.board.CommunityBoardService;
import com.example.look_lend_backend.service.board.request.CommunityBoardRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/communityBoard")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class CommunityBoardController {

    @Autowired
    private CommunityBoardService communityBoardService;

    @GetMapping("/list")
    public List<CommunityBoard> communityList () {
        log.info("CommunityBoardList");
        return communityBoardService.list();
    }

    @PostMapping("/register")
    public void communityRegister (@RequestBody CommunityBoardRequest communityBoardRequest) {
        log.info("communityRegister()");

        communityBoardService.register(communityBoardRequest);
    }

    @GetMapping("/{communityNo}")
    public CommunityBoard communityBoardRead(@PathVariable("communityNo") Long communityNo) {
        log.info("communityRead()");

        return communityBoardService.read(communityNo);
    }

    @DeleteMapping("/{communityNo}")
    public void communityRemove (@PathVariable("communityNo") Long communityNo) {
        log.info("communityRemove()");

        communityBoardService.remove(communityNo);
    }

    @PutMapping("/{communityNo}")
    public CommunityBoard communityModify (@PathVariable("communityNo") Long communityNo, @RequestBody CommunityBoard communityBoard) {
        log.info("lendModify()");

        communityBoard.setCommunityNo(communityNo);
        communityBoardService.modify(communityBoard);

        return communityBoard;
    }
}



