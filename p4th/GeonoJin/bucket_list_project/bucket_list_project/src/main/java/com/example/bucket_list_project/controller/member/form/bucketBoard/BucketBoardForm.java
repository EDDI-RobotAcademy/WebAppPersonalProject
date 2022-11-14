package com.example.bucket_list_project.controller.member.form.bucketBoard;

import com.example.bucket_list_project.service.bucketBoard.request.bucketBoard.BucketBoardRequest;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class BucketBoardForm {

    private String bucketTitle;
    private String bucketContent;
    private String bucketCategory;
    private Boolean switchValue;
    private String currentWriter;

    public BucketBoardRequest toBucketBoardRequest() {
        return new BucketBoardRequest(
                bucketTitle, bucketContent, bucketCategory, switchValue, currentWriter);
    }
}
