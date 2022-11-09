package kr.pjj.demo.service.boards.exercise;

import kr.pjj.demo.entity.boards.exercise.Diary;
import kr.pjj.demo.repository.boards.exercise.DiaryRepository;
import kr.pjj.demo.repository.member.MemberRepository;
import kr.pjj.demo.service.security.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Slf4j
@Service
public class DiaryServiceImpl implements DiaryService{

    @Autowired
    DiaryRepository repository;

    @Autowired
    RedisService redisService;

    @Override
    public List<Diary> list() {
        List<Diary> totalDiary ;
        totalDiary= repository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));

        log.info("다이어리 리스트 조회 메소드 실행"+ Arrays.toString(new List[]{totalDiary}) );

        return repository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    }

}
