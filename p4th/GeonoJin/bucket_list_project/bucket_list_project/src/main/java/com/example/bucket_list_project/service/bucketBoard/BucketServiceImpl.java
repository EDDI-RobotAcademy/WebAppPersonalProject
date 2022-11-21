package com.example.bucket_list_project.service.bucketBoard;

import com.example.bucket_list_project.entity.Board.BucketBoard;
import com.example.bucket_list_project.entity.Board.ImgFile;
import com.example.bucket_list_project.repository.bucketBoard.BucketBoardRepository;
import com.example.bucket_list_project.repository.bucketBoard.ImgFileRepository;
import com.example.bucket_list_project.service.bucketBoard.request.bucketBoard.BucketBoardRequest;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;


@Service
@Slf4j
public class BucketServiceImpl implements BucketService {

    @Autowired
    private BucketBoardRepository bucketBoardRepository;

    @Autowired
    private ImgFileRepository imgFileRepository;


    @Override
    public void register(BucketBoardRequest bucketBoardRequest, MultipartFile imgFile) {
        log.info("게시물 저장" + bucketBoardRequest);
        BucketBoard board = new BucketBoard();
        ImgFile file = new ImgFile();


        board.setBucketTitle(bucketBoardRequest.getBucketTitle());
        board.setBucketCategory(bucketBoardRequest.getBucketCategory());
        board.setBucketContent(bucketBoardRequest.getBucketContent());
        board.setSwitchValue(bucketBoardRequest.getSwitchValue());
        board.setWriter(bucketBoardRequest.getCurrentWriter());

        bucketBoardRepository.save(board);

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
        file.setBucketBoard(board);
        imgFileRepository.save(file);
    }

    @Override
    public List<BucketBoard> list() {
        List<BucketBoard> bucketBoards = bucketBoardRepository.findAll();

        return bucketBoards;
    }

    @Override
    public BucketBoard bucketRead(Long bucketId) {
        Optional<BucketBoard> maybeBucket = bucketBoardRepository.findById(bucketId);

        if (maybeBucket.equals(Optional.empty())) {
            log.info("정보가 없다");
            return null;
        }

        return maybeBucket.get();
    }

    @Override
    public ImgFile imgFileDownload(Long bucketId) {
        log.info("imgFileDownload");
        Optional<ImgFile> maybeImgFile = imgFileRepository.findByImgFile(bucketId);

        if (maybeImgFile.equals(Optional.empty())) {
            log.info("이미지 파일이 없음");
            return null;
        }

        return maybeImgFile.get();
    }

    @Override
    public void bucketModify(BucketBoard bucketBoard) {
        log.info("bucketModify");

        bucketBoardRepository.save(bucketBoard);
    }

    @Override
    public void delete(Long bucketId) {
        bucketBoardRepository.deleteById(bucketId);
    }

    @Override
    public List<BucketBoard> findBucketListByCategory(String bucketCategory) {
        log.info("findBucketListByCategory" + bucketCategory);

        return bucketBoardRepository.findByBucketCategory(bucketCategory);
    }

    @Override
    public List<BucketBoard> findBucketListByUserNickname(String userNickname) {
        log.info("findBucketListByUserNickname" + userNickname);

        return bucketBoardRepository.findByBucketListWriter(userNickname);
    }

    @Override
    public List<BucketBoard> bucketLIstSearch(String searchWord) {
        log.info("bucketLIstSearch" + searchWord);

        return bucketBoardRepository.findByBucketTitleContaining(searchWord);
    }
}
