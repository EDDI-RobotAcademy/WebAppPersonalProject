package com.example.bucket_list_project.service.bucketBoard;

import com.example.bucket_list_project.entity.Board.BucketBoard;
import com.example.bucket_list_project.entity.Board.ImgFile;
import com.example.bucket_list_project.service.bucketBoard.request.bucketBoard.BucketBoardRequest;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface BucketService {

    public void register(BucketBoardRequest bucketBoardRequest, MultipartFile imgFile);

    public List<BucketBoard> list();

    public BucketBoard bucketRead(Long bucketId);

    public ImgFile imgFileDownload(Long bucketId);

    public void bucketModify(BucketBoard bucketBoard);

    public void delete(Long bucketId);

    public List<BucketBoard> findBucketListByCategory(String bucketCategory);
    public List<BucketBoard> findBucketListByUserNickname(String userNickname);
}
