package com.example.bucket_list_project.service.bucketBoard.imgFile;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface ImgFileService {

    public void uploadImgFile(MultipartFile imgFile) throws IOException;
}
