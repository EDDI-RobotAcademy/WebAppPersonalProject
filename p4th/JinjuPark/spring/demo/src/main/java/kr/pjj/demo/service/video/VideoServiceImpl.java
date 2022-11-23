package kr.pjj.demo.service.video;

import kr.pjj.demo.entity.video.Video;
import kr.pjj.demo.repository.member.MemberRepository;
import kr.pjj.demo.repository.video.MemberSaveVideoRepository;
import kr.pjj.demo.repository.video.VideoRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

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

    @Override
    public List<String> myVideoRead(Long memberId){

        log.info("세이브 비디오리스트- 저장한 멤버아이디: " + memberId);
        List<String> myVideoList = saveVideoRepository.findMemberSaveVideoByMemberId(memberId);

        if (myVideoList.equals(Optional.empty())) {
            log.info("Can't find save video!!");
            return null;
            }

        log.info("멤버가 저장한 세이브 비디오리스트- src: " + myVideoList);
        return myVideoList;
    }

}
