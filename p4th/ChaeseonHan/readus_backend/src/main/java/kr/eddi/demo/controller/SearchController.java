package kr.eddi.demo.controller;

import kr.eddi.demo.entity.CommunityBoard;
import kr.eddi.demo.service.SearchServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/search")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class SearchController {

    @Autowired
    SearchServiceImpl service;

    @GetMapping("/title-contents/{keyword}")
    public List<CommunityBoard> searchBoardAtTitleAndContents(@PathVariable("keyword") String keyword) {
        return service.searchBoardWithTitleAndContents(keyword);
    }


}
