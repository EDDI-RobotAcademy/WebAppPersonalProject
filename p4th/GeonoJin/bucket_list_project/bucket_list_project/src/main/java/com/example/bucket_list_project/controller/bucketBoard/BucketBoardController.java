package com.example.bucket_list_project.controller.bucketBoard;

import com.example.bucket_list_project.service.bucketBoard.BucketService;
import com.example.bucket_list_project.service.bucketBoard.request.bucketBoard.BucketBoardRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


@Slf4j
@RestController
@RequestMapping("/bucket")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class BucketBoardController {

    @Autowired
    private BucketService service;

    @ResponseBody
    @PostMapping(value = "/register",
            consumes = {MediaType.MULTIPART_FORM_DATA_VALUE, MediaType.APPLICATION_JSON_VALUE})
    public void registerBucket(@RequestPart(value = "fileList")MultipartFile file,
                               @RequestPart(value = "info")BucketBoardRequest boardRequest){
        log.info("registerBucket: "+file);
        log.info("registerBucket: "+boardRequest);

        service.register(boardRequest, file);
    }
}
