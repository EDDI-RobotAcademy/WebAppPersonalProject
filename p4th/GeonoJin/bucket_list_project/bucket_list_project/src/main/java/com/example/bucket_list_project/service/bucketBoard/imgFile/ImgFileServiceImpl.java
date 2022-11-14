package com.example.bucket_list_project.service.bucketBoard.imgFile;

import com.example.bucket_list_project.entity.Board.BucketBoard;
import com.example.bucket_list_project.entity.Board.ImgFile;
import com.example.bucket_list_project.repository.bucketBoard.ImgFileRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

@Slf4j
@Service
public class ImgFileServiceImpl implements ImgFileService{

    @Autowired
    private ImgFileRepository imgFileRepository;

    @Override
    public void uploadImgFile(MultipartFile imgFile) {
        ImgFile file = new ImgFile();

        UUID uuid = UUID.randomUUID();

        String originalFileName = imgFile.getOriginalFilename();
        String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."),
                originalFileName.length());
        String duplicatePreventionFileName = uuid.toString() + fileExtension;
        log.info("변경된 파일이름 " +duplicatePreventionFileName);
        String filePath = "../../bucket_list_frontend/src/assets/thumbnail/";

        try {
            FileOutputStream writer = new FileOutputStream(
                    filePath + duplicatePreventionFileName
            );

            log.info("파일 배치 완료");

            writer.write(imgFile.getBytes());
            writer.close();
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        file.setFilePath(filePath);
        file.setFileOriginalName(originalFileName);
        file.setChangeFileName(duplicatePreventionFileName);

        log.info("파일 db 저장 완료");
        imgFileRepository.save(file);
    }
}
