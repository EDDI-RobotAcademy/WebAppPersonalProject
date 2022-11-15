package com.example.bucket_list_project.service.bucketContent;

import com.example.bucket_list_project.entity.Board.BucketBoard;
import com.example.bucket_list_project.entity.Board.ImgFile;
import com.example.bucket_list_project.repository.bucketBoard.BucketBoardRepository;
import com.example.bucket_list_project.repository.bucketBoard.ImgFileRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class BucketBoardTest {

    @Autowired
    private BucketBoardRepository bucketBoardRepository;

    @Autowired
    private ImgFileRepository imgFileRepository;

    @Test
    public void registerBucket(){
        BucketBoard board = new BucketBoard("제목","내용","일상",false,"닉네임");
        bucketBoardRepository.save(board);

        ImgFile imgFile = new ImgFile("이미지.jpg","../../bucket_list_frontend/src/assets/thumbnail/",
                "변경된이름.jpg"
                );
        imgFile.setBucketBoard(board);
        imgFileRepository.save(imgFile);
    }
}
