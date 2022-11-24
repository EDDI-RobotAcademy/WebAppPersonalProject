package kr.pjj.demo.repository.video;

import kr.pjj.demo.entity.video.Video;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VideoRepository extends JpaRepository<Video, Long> {

}
