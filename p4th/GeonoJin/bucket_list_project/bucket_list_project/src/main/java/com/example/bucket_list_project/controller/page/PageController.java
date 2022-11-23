package com.example.bucket_list_project.controller.page;

import com.example.bucket_list_project.service.page.PageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/{categoryName}")
    public int getTotalPageByCategory(@PathVariable("categoryName") String categoryName) {
        log.info("getTotalPageByCategory" + categoryName);

        return pageService.getTotalPageByCategory(categoryName);
    }

}
