package kr.pjj.demo.service.video;

import kr.pjj.demo.entity.video.Video;

import java.util.List;

public interface VideoService {

    public List<Video> videoList();

    public String myVideoSave(Long memberId, Long videoId);

    public List<String> myVideoRead(Long memberId);
}
