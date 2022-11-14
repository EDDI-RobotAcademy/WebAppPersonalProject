package com.example.bucket_list_project.repository.bucketBoard;

import com.example.bucket_list_project.entity.Board.BucketBoard;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BucketBoardRepository extends JpaRepository<BucketBoard, Long> {
}
