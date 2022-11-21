package com.example.demo.controller.board;

import com.example.demo.entity.board.Image;
import com.example.demo.entity.board.Recipe;
import com.example.demo.service.recipe.RecipeServiceImpl;
import com.example.demo.service.recipe.request.ModifyRequest;
import com.example.demo.service.recipe.request.RecipeRegisterRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/recipe")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class RecipeController {

    @Autowired
    RecipeServiceImpl service;

    @PostMapping(value = "/upload",
            consumes = {
                    MediaType.IMAGE_JPEG_VALUE,
                    MediaType.IMAGE_GIF_VALUE,
                    MediaType.IMAGE_PNG_VALUE,
                    MediaType.MULTIPART_FORM_DATA_VALUE,
                    MediaType.APPLICATION_JSON_VALUE})
    public Boolean imageProcedure(@RequestPart(value = "files") List<MultipartFile> imageFileList,
                                  @RequestPart(value = "title") String title,
                                  @RequestPart(value = "category") String category,
                                  @RequestPart(value = "content") String content,
                                  @RequestPart(value = "writer") String recipeWriter
                                  ) {

        log.info("imageProcedure(): " + imageFileList);

        List<String> imgFileRequestList = new ArrayList<>();

        try {
            for (MultipartFile multipartFile : imageFileList) {
                log.info("requestUploadFilesWithText() - Make file: " +
                        multipartFile.getOriginalFilename());
                imgFileRequestList.add(multipartFile.getOriginalFilename());


                FileOutputStream writer = new FileOutputStream(
                        "../../flutter/assets/images/uploadImgs/" + multipartFile.getOriginalFilename()
                );
                log.info("디렉토리에 파일 배치 성공!");

                writer.write(multipartFile.getBytes());
                writer.close();

            }
            RecipeRegisterRequest request = new RecipeRegisterRequest(title, category, content, recipeWriter);
            service.register(request, imgFileRequestList);


        } catch (Exception e) {
            e.printStackTrace();
        }

        log.info("requestUploadFilesWithText(): Success!");

        return true;
    }

    @GetMapping("/list")
    public List<Recipe> recipeList () {
        log.info("recipeList()");

        return service.list();
    }

    @GetMapping("/{recipeNo}")
    public List<Image> recipeRead (@PathVariable("recipeNo") Long recipeNo) {
        log.info("recipeRead()");

        return service.read(recipeNo);
    }

    @PutMapping("/{recipeNo}")
    public void recipeModify (@PathVariable("recipeNo") Long recipeNo, @RequestBody ModifyRequest request) {
        log.info("recipeModify()");

        service.modify(recipeNo, request);

    }
    @DeleteMapping("/{recipeNo}")
    public void recipeDelete (@PathVariable("recipeNo") Long recipeNo) {
        log.info("recipeDelete()");

        service.remove(recipeNo);

    }
}