package com.example.bucket_list_project.service.bucketBoard;

import com.example.bucket_list_project.entity.Board.BucketBoard;
import com.example.bucket_list_project.service.bucketBoard.request.bucketBoard.BucketBoardRequest;

import java.io.IOException;

public interface BucketService {

    public void register(BucketBoardRequest bucketBoardRequest);
}
