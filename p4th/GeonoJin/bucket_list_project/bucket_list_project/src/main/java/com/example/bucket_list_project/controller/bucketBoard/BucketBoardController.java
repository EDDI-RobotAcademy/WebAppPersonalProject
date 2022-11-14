package com.example.bucket_list_project.controller.bucketBoard;

import com.example.bucket_list_project.controller.member.form.bucketBoard.BucketBoardForm;
import com.example.bucket_list_project.service.bucketBoard.BucketService;
import com.example.bucket_list_project.service.bucketBoard.imgFile.ImgFileService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Slf4j
@RestController
@RequestMapping("/bucket")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class BucketBoardController {

    @Autowired
    private BucketService bucketService;


    @PostMapping("/register")
    public void bucketRegister (@RequestBody BucketBoardForm bucketBoardForm) {
        log.info("bucketRegister");
        bucketService.register(bucketBoardForm.toBucketBoardRequest());
    }

}
