package com.example.bucket_list_project.service.bucketBoard.request.bucketBoard;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Getter
@ToString
@NoArgsConstructor
public class BucketBoardRequest {

    private String bucketTitle;
    private String bucketContent;
    private String bucketCategory;
    private Boolean switchValue;
    private String currentWriter;


    public BucketBoardRequest(String bucketTitle,
                              String bucketContent,
                              String bucketCategory,
                              Boolean switchValue,
                              String currentWriter
    ) {
        this.bucketTitle = bucketTitle;
        this.bucketCategory = bucketCategory;
        this.bucketContent = bucketContent;
        this.switchValue = switchValue;
        this.currentWriter = currentWriter;
    }
}
