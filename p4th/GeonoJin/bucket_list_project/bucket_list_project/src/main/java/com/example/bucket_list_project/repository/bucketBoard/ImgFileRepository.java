package com.example.bucket_list_project.repository.bucketBoard;

import com.example.bucket_list_project.entity.Board.ImgFile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImgFileRepository extends JpaRepository<ImgFile, Long> {
}
