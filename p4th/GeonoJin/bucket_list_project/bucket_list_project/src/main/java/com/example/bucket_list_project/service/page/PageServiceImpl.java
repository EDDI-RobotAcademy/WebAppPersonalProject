package com.example.bucket_list_project.service.page;

import com.example.bucket_list_project.entity.Board.BucketBoard;
import com.example.bucket_list_project.repository.bucketBoard.BucketBoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class PageServiceImpl implements PageService{


    @Autowired
    private BucketBoardRepository bucketBoardRepository;

    @Override
    public int getTotalPageNum(Pageable pageable) {
        Page<BucketBoard> bucketBoardPage = bucketBoardRepository.findAll(PageRequest.of(0,12));

        return bucketBoardPage.getTotalPages();
    }

    @Override
    public int getTotalPageByCategory(String categoryName) {
        Page<BucketBoard> bucketBoardPageByCategory = bucketBoardRepository.findByBucketCategory(categoryName, PageRequest.of(0, 12));

        return bucketBoardPageByCategory.getTotalPages();
    }

    @Override
    public int getTotalPageByMyBucket(String userNickname) {
        Page<BucketBoard> bucketBoardPageByUserNickname = bucketBoardRepository.findByBucketListWriter(userNickname, PageRequest.of(0, 12));

        return bucketBoardPageByUserNickname.getTotalPages();
    }
}
