package com.example.bucket_list_project.service.bucketBoard;

import com.example.bucket_list_project.entity.Board.BucketBoard;
import com.example.bucket_list_project.service.bucketBoard.request.bucketBoard.BucketBoardRequest;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface BucketService {

    public void register(BucketBoardRequest bucketBoardRequest, MultipartFile imgFile);

    public List<BucketBoard> list();
}
