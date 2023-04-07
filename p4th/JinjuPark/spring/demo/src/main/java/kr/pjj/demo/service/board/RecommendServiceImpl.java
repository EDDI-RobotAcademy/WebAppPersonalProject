package kr.pjj.demo.service.board;

import kr.pjj.demo.entity.board.Diary;
import kr.pjj.demo.entity.board.Recommend;
import kr.pjj.demo.entity.member.Member;
import kr.pjj.demo.repository.board.DiaryRepository;
import kr.pjj.demo.repository.board.RecommendRepository;
import kr.pjj.demo.repository.member.MemberRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Slf4j
@Service
public class RecommendServiceImpl implements RecommendService{

    @Autowired
    RecommendRepository recommendRepository;

    @Autowired
    DiaryRepository diaryRepository;

    @Autowired
    MemberRepository memberRepository;


    @Override
    public List<Integer> recommendUpDown(Long memberId, Long boardNo, String thumbType){
        final String THUMB_UP = "thumbUp";
        final String THUMB_DOWN = "thumbDown";

        final Integer countLikes = 1;
        final Integer countNoLikes = 1;

        Optional<Diary> maybeDiary = diaryRepository.findById(boardNo);
        Diary diary = maybeDiary.get();
        List<Integer> thumbStatus = new ArrayList<>();


        Optional<Recommend> maybeRecommend = recommendRepository.findByDiaryAndMember(boardNo, memberId);

        Optional<Member> maybeMember = memberRepository.findById(memberId) ;
        Member member = maybeMember.get();

        // 2. 추천/ 비추천이 클릭된 경우
        // (1) 해당 멤버가 해당 게시글 추천한 이력이 없는 경우(= 쿼리결과가 empty가 나오는 경우)
        if(maybeRecommend.equals(Optional.empty())) {
            Recommend firstRecommend = new Recommend();

            switch(thumbType){
                case THUMB_UP:
                    //1) 추천 반영
                        thumbStatus.add(diary.getLikes() + countLikes);
                        thumbStatus.add(diary.getNoLikes());
                        diary.setLikes(diary.getLikes() + countLikes);
                        diaryRepository.save(diary);
                        firstRecommend.setDiary(diary);
                        firstRecommend.setMember(member);
                        firstRecommend.setThumbUpFlag(true);
                        recommendRepository.save(firstRecommend);
                        return thumbStatus;

                case THUMB_DOWN:
                    //2) 비추천 반영
                        thumbStatus.add(diary.getLikes());
                        thumbStatus.add(diary.getNoLikes() + countNoLikes);
                        diary.setNoLikes(diary.getNoLikes() + countNoLikes);
                        diaryRepository.save(diary);
                        firstRecommend.setDiary(diary);
                        firstRecommend.setMember(member);
                        firstRecommend.setThumbDownFlag(true);
                        recommendRepository.save(firstRecommend);
                        return thumbStatus;
            }

        } else {
            // (2) 해당 멤버가 추천/비추천 이력이 있는 경우
            Recommend recommend = maybeRecommend.get();

            switch(thumbType){
                case THUMB_UP:
                    // 1) 추천이력은 없는 경우 -> 추천 반영
                    if(!recommend.getThumbUpFlag()){
                        thumbStatus.add(diary.getLikes() + countLikes);
                        thumbStatus.add(diary.getNoLikes());
                        diary.setLikes(diary.getLikes() + countLikes);
                        diaryRepository.save(diary);
                        recommend.setThumbUpFlag(true);
                        recommendRepository.save(recommend);
                        return thumbStatus;
                    } else {
                     // 2) 추천이력 있는 경우 -> 추천 취소됨
                        thumbStatus.add(diary.getLikes() - countLikes);
                        thumbStatus.add(diary.getNoLikes());
                        diary.setLikes(diary.getLikes() - countLikes);
                        recommend.setThumbUpFlag(false);
                        recommendRepository.save(recommend);
                        diaryRepository.save(diary);
                        return thumbStatus;
                    }

                case THUMB_DOWN:
                    // 3) 비추천이력은 없는 경우 -> 비추천 반영
                    if(!recommend.getThumbDownFlag()){
                        thumbStatus.add(diary.getLikes());
                        thumbStatus.add(diary.getNoLikes() + countNoLikes);
                        diary.setNoLikes(diary.getNoLikes() + countNoLikes);
                        diaryRepository.save(diary);
                        recommend.setThumbDownFlag(true);
                        recommendRepository.save(recommend);
                        return thumbStatus;
                    } else{
                      // 4) 비추천이력 있는 경우 -> 비추천 취소
                        thumbStatus.add(diary.getLikes());
                        thumbStatus.add(diary.getNoLikes() - countNoLikes);
                        diary.setNoLikes(diary.getNoLikes() - countNoLikes);
                        diaryRepository.save(diary);
                        recommend.setThumbDownFlag(false);
                        recommendRepository.save(recommend);
                        return thumbStatus;
                    }
            }
        }
        return thumbStatus;
    }


    public List<Integer> recommendStatus(Long boardNo){

        Optional<Diary> maybeDiary = diaryRepository.findById(boardNo);
        Diary diary = maybeDiary.get();
        List<Integer> thumbStatus = new ArrayList<>();

        thumbStatus.add(diary.getLikes());
        thumbStatus.add(diary.getNoLikes());
        return thumbStatus;

    }
}       // 추천/ 비추천 멤버 id 당 1번 가능하고, 다시 누를 시 추천/비추천 취소되는 기능
        //1. thump 타입(thumbCheck, thumbUp, thumbDown)을 확인
        // (1) thumbCheck 상태체크면 그냥 값만 리턴 (게시글 상세페이지에 첫 reload 시 해당 게시글의 추천/비추천수 출력용)
        // (2) 타입이 thumbUp/down 이면 recommend에서 멤버 id & boardNo 같은 recommend 내역에 저장된 이력이 있나 찾아보기
        //  (2-1)-> 있으면 추천 비추천 flag 확인(true: 이전에 누른 적 있음/ false: 이전에 누른 적 없음 )
        //  (2-2)-> flag false면 요청 실행 후 recommend.thumbUpFlag, thumbDownFlag 저장  + diary로 like, nolike 저장
        //  (2-3) flag true면 확인후 승인 또는 반려 ->recommend.thumbUpFlag, thumbDownFlag 저장  + diary로 like, nolike 저장


