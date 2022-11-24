package kr.pjj.demo.controller.video;

import kr.pjj.demo.controller.video.request.MyVideoListRequest;
import kr.pjj.demo.controller.video.request.VideoRequest;
import kr.pjj.demo.entity.video.Video;
import kr.pjj.demo.service.video.VideoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("hometwang/videos")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class VideoController {

    @Autowired
    private VideoService videoService;


    @GetMapping("/list")
    public List<Video> videoList() {
        log.info("비디오 리스트");

        return videoService.videoList();
    }

    @PostMapping("/mysave")
    public String myVideoSave(@RequestBody VideoRequest videoRequest){

        log.info("마이비디오 요청 비디오번호: "+videoRequest.getVideoId());
        Long memberId = videoRequest.getMemberId();
        Long videoId = videoRequest.getVideoId();

        return videoService.myVideoSave(memberId, videoId);
    }

    @PostMapping("/mysave/list")
    public List<String> myVideoRead(@RequestBody MyVideoListRequest myVideoListRequest){

        Long memberId = myVideoListRequest.getMemberId();
        log.info("마이비디오 조회하는 멤버아이디: "+memberId);
        return videoService.myVideoRead(memberId);
    }

}
