package kr.pjj.demo.service.video;

import kr.pjj.demo.entity.member.Member;
import kr.pjj.demo.entity.video.MemberSaveVideo;
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

    @Override
    public String myVideoSave(Long memberId, Long videoId){
        String msg = "";
        // 멤버 id와 비디오 id 둘다 동일한 리스트 있는 지 검색
        Optional<MemberSaveVideo> maybeMyVideoList = saveVideoRepository.findByMemberIdAndVideoId(memberId, videoId);

        if (maybeMyVideoList.equals(Optional.empty())) {
            log.info("비디오 저장");
            MemberSaveVideo memberSaveVideo = new MemberSaveVideo();

            Optional<Member> maybeMember = memberRepository.findById(memberId);
            Member member = maybeMember.get();

            Optional<Video> maybeVideo = videoRepository.findById(videoId);
            Video video = maybeVideo.get();

            memberSaveVideo.setMember(member);
            memberSaveVideo.setVideo(video);
            saveVideoRepository.save(memberSaveVideo);
            msg = "비디오가 My Video List에 저장되었습니다.";
        } else {
            saveVideoRepository.deleteById(maybeMyVideoList.get().getId());
            msg = "비디오가 My Video List에서 삭제되었습니다.";
            log.info("비디오 삭제 완료");
        }
        return msg;
    }

}
