package com.example.bucket_list_project.service.bucketBoard;

import com.example.bucket_list_project.entity.Board.BucketBoard;
import com.example.bucket_list_project.entity.Board.ImgFile;
import com.example.bucket_list_project.repository.bucketBoard.BucketBoardRepository;
import com.example.bucket_list_project.repository.bucketBoard.ImgFileRepository;
import com.example.bucket_list_project.service.bucketBoard.request.bucketBoard.BucketBoardRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
@Slf4j
public class BucketServiceImpl implements BucketService {

    @Autowired
    private BucketBoardRepository bucketBoardRepository;

    @Override
    public void register(BucketBoardRequest bucketBoardRequest) {
        log.info("게시물 저장" + bucketBoardRequest);
        BucketBoard board = new BucketBoard();

        board.setBucketTitle(bucketBoardRequest.getBucketTitle());
        board.setBucketCategory(bucketBoardRequest.getBucketCategory());
        board.setBucketContent(bucketBoardRequest.getBucketContent());
        board.setSwitchValue(bucketBoardRequest.getSwitchValue());
        board.setWriter(bucketBoardRequest.getCurrentWriter());

        bucketBoardRepository.save(board);
    }
}
