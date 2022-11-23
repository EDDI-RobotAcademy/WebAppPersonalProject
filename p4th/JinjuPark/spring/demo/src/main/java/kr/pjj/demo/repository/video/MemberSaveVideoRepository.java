package kr.pjj.demo.repository.video;

import kr.pjj.demo.entity.video.MemberSaveVideo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface MemberSaveVideoRepository extends JpaRepository<MemberSaveVideo, Long> {


    //멤버아이디와 비디오아이디 일치하는 리스트 검색(해당 비디오가 멤버 저장목록에 있는 지)
    @Query("select msv from MemberSaveVideo msv join msv.video mv join fetch msv.member mm where mm.id = :memberId and mv.id= :videoId")
    Optional<MemberSaveVideo> findByMemberIdAndVideoId(Long memberId, Long videoId);

    //멤버아이디로 일치하는 비디오리스트 검색
    @Query("select msv.video.src from MemberSaveVideo msv join msv.member mm where mm.id = :memberId")
    List<String> findMemberSaveVideoByMemberId(Long memberId);



}
