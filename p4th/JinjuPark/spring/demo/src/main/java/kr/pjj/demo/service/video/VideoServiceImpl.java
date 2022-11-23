package kr.pjj.demo.service.video;

import kr.pjj.demo.entity.video.Video;
import kr.pjj.demo.repository.member.MemberRepository;
import kr.pjj.demo.repository.video.MemberSaveVideoRepository;
import kr.pjj.demo.repository.video.VideoRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    VideoRepository videoRepository;

    @Autowired
    MemberSaveVideoRepository saveVideoRepository;

    @Autowired
    MemberRepository memberRepository;


    @Override
    public List<Video> videoList(){
        return videoRepository.findAll();
    }

}
