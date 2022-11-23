package com.example.bucket_list_project.repository.bucketBoard;

import com.example.bucket_list_project.entity.Board.BucketBoard;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BucketBoardRepository extends JpaRepository<BucketBoard, Long> {

    @Query("select b from BucketBoard b where b.bucketCategory = :bucketCategory")
    Page<BucketBoard> findByBucketCategory(@Param("bucketCategory") String bucketCategory, Pageable pageable);

    @Query("select b from BucketBoard b where b.writer = :writer")
    Page<BucketBoard> findByBucketListWriter(@Param("writer") String writer, Pageable pageable);

    List<BucketBoard> findByBucketTitleContaining(String bucketTitle);
}
