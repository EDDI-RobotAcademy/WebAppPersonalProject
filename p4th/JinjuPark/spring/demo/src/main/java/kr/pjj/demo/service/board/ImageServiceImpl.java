package kr.pjj.demo.service.board;

import kr.pjj.demo.repository.board.DiaryRepository;
import kr.pjj.demo.repository.board.ImageRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class ImageServiceImpl implements ImageService{

    @Autowired
    ImageRepository imageRepository;

    @Autowired
    DiaryRepository diaryRepository;

    @Override
    public List<String> read(Long boardNo){

        //이미지 reName 리스트 리턴
        List<String> images = imageRepository.findImagesByBoardNo(boardNo);

        if(images.equals(Optional.empty())){
           return null;
        }
        return images;
    }
}
