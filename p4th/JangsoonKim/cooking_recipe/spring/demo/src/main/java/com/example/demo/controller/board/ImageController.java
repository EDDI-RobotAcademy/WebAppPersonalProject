package com.example.demo.controller.board;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/recipe-image")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class ImageController {

    @PostMapping(value = "/upload",
            consumes = {
                    MediaType.IMAGE_JPEG_VALUE,
                    MediaType.IMAGE_GIF_VALUE,
                    MediaType.IMAGE_PNG_VALUE,
                    MediaType.MULTIPART_FORM_DATA_VALUE,
                    MediaType.APPLICATION_JSON_VALUE })
    public Boolean imageProcedure(@RequestPart(value = "files") List<MultipartFile> imageFileList
                                  /*@RequestPart(value = "recipeRequest") RecipeRegisterRequest request*/) {

        log.info("imageProcedure(): " + imageFileList);

        List<String> imgFileRequestList = new ArrayList<>();

        try {
            for (MultipartFile multipartFile: imageFileList) {
                log.info("requestUploadFilesWithText() - Make file: " +
                        multipartFile.getOriginalFilename());
                imgFileRequestList.add(multipartFile.getOriginalFilename());


                FileOutputStream writer = new FileOutputStream(
                        "../../flutter/assets/images/uploadImgs/" + multipartFile.getOriginalFilename()
                );
                log.info("디렉토리에 파일 배치 성공!");
                log.info("imgFileRequest"+imgFileRequestList);
                writer.write(multipartFile.getBytes());
                writer.close();

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        log.info("requestUploadFilesWithText(): Success!");

        return true;
    }
}