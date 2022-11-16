package com.example.bucket_list_project.repository.bucketBoard;

import com.example.bucket_list_project.entity.Board.ImgFile;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;


public interface ImgFileRepository extends JpaRepository<ImgFile, Long> {

    @Query("select i from ImgFile i where i.bucket.bucketId = :bucketId")
    Optional<ImgFile> findByImgFile(@Param("bucketId") Long bucketId);


}
