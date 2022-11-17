package com.example.bucket_list_project.service.bucketContent;

import com.example.bucket_list_project.entity.Board.BucketBoard;
import com.example.bucket_list_project.entity.Board.ImgFile;
import com.example.bucket_list_project.repository.bucketBoard.BucketBoardRepository;
import com.example.bucket_list_project.repository.bucketBoard.ImgFileRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Optional;

@SpringBootTest
public class BucketBoardTest {

    @Autowired
    private BucketBoardRepository bucketBoardRepository;

    @Autowired
    private ImgFileRepository imgFileRepository;

    @Test
    public void registerBucket() {
        BucketBoard board = new BucketBoard("제목", "내용", "일상", false, "닉네임");
        bucketBoardRepository.save(board);

        ImgFile imgFile = new ImgFile("이미지.jpg", "../../bucket_list_frontend/src/assets/thumbnail/",
                "변경된이름.jpg"
        );
        imgFile.setBucketBoard(board);
        imgFileRepository.save(imgFile);
    }

    @Test
    public void findBucketInfo() {
        Optional<BucketBoard> board = bucketBoardRepository.findById(1L);
        BucketBoard bucketBoard = board.get();
        Long bucketNo = bucketBoard.getBucketId();

        Optional<ImgFile> imgFile = imgFileRepository.findByImgFile(bucketNo);

        ImgFile imgFile1 = imgFile.get();
        String changeImgFileName = imgFile1.getChangeFileName();

        System.out.println(changeImgFileName);

    }
    @Test
    public void findBucketBoard(){
        List<BucketBoard> bucketBoards = bucketBoardRepository.findAll();

        System.out.println(bucketBoards);
    }

    @Test
    public void bucketListModify(){
        Optional<BucketBoard> mayBeBucket = bucketBoardRepository.findById((long) 1);
        BucketBoard bucketBoard = mayBeBucket.get();

        bucketBoard.modifyTitle("제목변경 테스트");

        bucketBoardRepository.save(bucketBoard);
    }
}
