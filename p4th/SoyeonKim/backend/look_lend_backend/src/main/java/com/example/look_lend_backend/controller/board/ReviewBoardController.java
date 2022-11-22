package com.example.look_lend_backend.controller.board;

import com.example.look_lend_backend.entity.board.CommunityBoard;
import com.example.look_lend_backend.entity.board.ReviewBoard;
import com.example.look_lend_backend.service.board.ReviewBoardService;
import com.example.look_lend_backend.service.board.request.ReviewBoardRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Slf4j
@RestController
@RequestMapping("/reviewBoard")
@CrossOrigin(origins ="http://localhost:8080", allowedHeaders = "*")
public class ReviewBoardController {

    @Autowired
    private ReviewBoardService reviewBoardService;

    @GetMapping("/list")
    public List<ReviewBoard> reviewList () {
        log.info("reviewList");
        return reviewBoardService.list();
    }

    @PostMapping("/register")
    public void reviewRegister (@RequestBody ReviewBoardRequest reviewBoardRequest) {
        log.info("reviewRegister()");

        reviewBoardService.register(reviewBoardRequest);
    }

    @GetMapping("/{reviewNo}")
    public ReviewBoard reviewBoardRead(@PathVariable("reviewNo") Long reviewNo) {
        log.info("reviewBoardRead()");

        return reviewBoardService.read(reviewNo);
    }

    @DeleteMapping("/{reviewNo}")
    public void reviewRemove (@PathVariable("reviewNo") Long reviewNo) {
        log.info("reviewRemove()");

        reviewBoardService.remove(reviewNo);
    }

    @PutMapping("/{reviewNo}")
    public ReviewBoard reviewModify (@PathVariable("reviewNo") Long reviewNo, @RequestBody ReviewBoard reviewBoard) {
        log.info("reviewModify()");

        reviewBoard.setReviewNo(reviewNo);
        reviewBoardService.modify(reviewBoard);

        return reviewBoard;
    }

}

