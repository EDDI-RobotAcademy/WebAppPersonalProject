package kr.pjj.demo.service.boards.exercise;

import kr.pjj.demo.controller.member.boards.exercise.request.DiaryRequest;
import kr.pjj.demo.entity.boards.exercise.Diary;
import kr.pjj.demo.entity.member.Member;
import kr.pjj.demo.repository.boards.exercise.DiaryRepository;
import kr.pjj.demo.repository.member.MemberRepository;
import kr.pjj.demo.service.security.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class DiaryServiceImpl implements DiaryService{

    @Autowired
    DiaryRepository repository;

    @Autowired
    RedisService redisService;

    @Autowired
    MemberRepository memberRepository;

    @Override
    public List<Diary> list() {
        List<Diary> totalDiary ;
        totalDiary= repository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));

        log.info("다이어리 리스트 조회 메소드 실행"+ Arrays.toString(new List[]{totalDiary}) );

        return repository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    }

    @Override
    public List<Diary> search(String keyword) {
        List<Diary> searchDiary ;
        searchDiary= repository.findByTitleContainingOrWriterContainingOrContentContaining(keyword, keyword, keyword);

        log.info("다이어리 리스트 검색 메소드 실행"+ Arrays.toString(new List[]{searchDiary}) );
        return repository.findByTitleContainingOrWriterContainingOrContentContaining(keyword, keyword, keyword);
    }

    @Override
    public void register(DiaryRequest diaryRequest) {
        Diary diary = new Diary();
        diary.setTitle(diaryRequest.getTitle());
        diary.setContent(diaryRequest.getContent());
        diary.setCategory(diaryRequest.getCategory());
        diary.setAuthority(diaryRequest.getAuthority());
        //조회수 0
        diary.setViews(0);
        //좋아요 0
        diary.setLikes(0);

        //1. 사용자 토큰 형식 변환
        //String writerToken = diaryRequest.getWriterToken();
        String writerToken = diaryRequest.getWriterToken().substring(1,37);
        log.info("작성자 토큰: " + writerToken);
        //2. 사용자 토큰 이용해서 멤버 id 번호 구하기
        Long writerId = redisService.getValueByKey(writerToken);
        //3. 멤버 id로 사용자 닉네임 구하기
        Optional<Member> maybeMember = memberRepository.findById(writerId);
        log.info("멤버 아이디:" + writerId );
        Member member = maybeMember.get();
        //4. 멤버 닉네임 writer로 설정
        diary.setWriter(member.getNickname());
        log.info("작성자 닉네임: " + member.getNickname());
        repository.save(diary);
    }

}
