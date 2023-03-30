package kr.pjj.demo.service.board;

import kr.pjj.demo.entity.board.Image;
import kr.pjj.demo.repository.board.DiaryRepository;
import kr.pjj.demo.repository.board.ImageRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class ImageServiceImpl implements ImageService{

    @Autowired
    ImageRepository imageRepository;

    @Autowired
    DiaryRepository diaryRepository;

    @Override
    public List<String> read(Long boardNo) {

        log.info("이미지 게시판 보드 넘버:" + boardNo);
        List<Image> imageList = imageRepository.findAllImagesByBoardId(boardNo);
        List<String> images = new ArrayList<>();

        if(imageList.size() > 0){
            log.info("이미지 있는 경우");
            for (int i = 0; i < imageList.size(); i++) {
                images.add(i, imageList.get(i).getReName());
            }
        }

        return images;
    }
}
