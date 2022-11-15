package com.example.bucket_list_project.service.bucketBoard.request.bucketBoard;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Getter
@NoArgsConstructor
@AllArgsConstructor
public class BucketBoardRequest {

    private String bucketTitle;
    private String bucketContent;
    private String bucketCategory;
    private Boolean switchValue;
    private String currentWriter;
}
