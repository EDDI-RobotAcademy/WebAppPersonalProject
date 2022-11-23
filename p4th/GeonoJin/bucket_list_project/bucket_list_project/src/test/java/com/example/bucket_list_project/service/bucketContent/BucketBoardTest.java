package com.example.bucket_list_project.service.bucketContent;

import com.example.bucket_list_project.entity.Board.BucketBoard;
import com.example.bucket_list_project.entity.Board.ImgFile;
import com.example.bucket_list_project.repository.bucketBoard.BucketBoardRepository;
import com.example.bucket_list_project.repository.bucketBoard.ImgFileRepository;
import com.example.bucket_list_project.service.bucketBoard.BucketService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Slice;
import org.springframework.data.redis.core.convert.Bucket;

import java.util.List;
import java.util.Optional;

@SpringBootTest
public class BucketBoardTest {

    @Autowired
    private BucketBoardRepository bucketBoardRepository;

    @Autowired
    private ImgFileRepository imgFileRepository;

    @Autowired
    private BucketService service;

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

    @Test
    public void deleteBucketList() {
        bucketBoardRepository.deleteById((long) 1);
    }

    @Test
    public void findBucketListByCategory() {

        Page<BucketBoard> bucketListByCategory = bucketBoardRepository.findByBucketCategory("요리", PageRequest.of(0, 2));
        List<BucketBoard> currentCategoryBucketList = bucketListByCategory.getContent();

        System.out.println(currentCategoryBucketList);
    }

    @Test
    public void findBucketListByNickname(){

        Page<BucketBoard> bucketBoardPage = bucketBoardRepository.findByBucketListWriter("관리자1", PageRequest.of(0, 12));
        List<BucketBoard> getWriterBucketList = bucketBoardPage.getContent();


        System.out.println(getWriterBucketList);
    }

    @Test
    public void searchByBucketTitle(){
        List<BucketBoard> searchBucketTitle = bucketBoardRepository.findByBucketTitleContaining("일상");

        System.out.println(searchBucketTitle);
    }
    @Test
    public void testPage(){
        List<BucketBoard> bucketListByPage = service.list(1);

        System.out.println(bucketListByPage);
    }
}
