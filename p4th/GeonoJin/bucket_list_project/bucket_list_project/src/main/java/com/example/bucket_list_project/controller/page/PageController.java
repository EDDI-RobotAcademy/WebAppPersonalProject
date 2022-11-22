package com.example.bucket_list_project.controller.page;

import com.example.bucket_list_project.service.page.PageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/page")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class PageController {

    @Autowired
    private PageService pageService;

    @GetMapping("/totalPage")
    public int getTotalPageNum(Pageable pageable){
        log.info("getTotalPageNum");

        return pageService.getTotalPageNum(pageable);
    }

}
