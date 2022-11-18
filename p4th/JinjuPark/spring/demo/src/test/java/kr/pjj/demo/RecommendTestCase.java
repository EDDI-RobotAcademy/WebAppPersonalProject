package kr.pjj.demo;

import kr.pjj.demo.entity.boards.exercise.Diary;
import kr.pjj.demo.entity.boards.exercise.Recommend;
import kr.pjj.demo.entity.member.Member;
import kr.pjj.demo.repository.boards.exercise.DiaryRepository;
import kr.pjj.demo.repository.boards.exercise.RecommendRepository;
import kr.pjj.demo.repository.member.MemberRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@SpringBootTest
public class RecommendTestCase {

    @Autowired
    RecommendRepository recommendRepository;

    @Autowired
    DiaryRepository diaryRepository;

    @Autowired
    MemberRepository memberRepository;

    @Test
    void thumbCheck() {
        Optional<Diary> maybeDiary = diaryRepository.findById((long)3);
        Diary diary = maybeDiary.get();
        List<Integer> thumbStatus = new ArrayList<>();

        thumbStatus.add(diary.getLikes());
        thumbStatus.add(diary.getNoLikes());
        System.out.println(thumbStatus);
    }

    @Test
    void firstThumbUpAndDown() {

        final String THUMB_UP = "thumbUp";
        final String THUMB_DOWN = "thumbDown";
        final Integer countLikes = 1;
        final Integer countNoLikes = 1;

        //추천/비추천 테스트용
        String thumbType = "thumbUp";       //테스트 옵션 1. 추천 테스트
        //String thumbType = "thumbDown";   //테스트 옵션 2. 비추천 테스트

        Optional<Diary> maybeDiary = diaryRepository.findById((long)4);
        Diary diary = maybeDiary.get();
        System.out.println("다이어리 1번 게시글 조회: "+ diary);

        List<Integer> thumbStatus = new ArrayList<>();

        //DB에 없는 게시글번호 +멤버번호 넣기
        Optional<Recommend> maybeRecommend = recommendRepository.findByDiaryAndMember((long)4, (long)2);

        Optional<Member> maybeMember = memberRepository.findById((long)2);
        Member member = maybeMember.get();

        if (maybeRecommend.equals(Optional.empty())) {
            Recommend firstRecommend = new Recommend();

            switch (thumbType) {
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
                    System.out.println("추천비추천 상태1: "+thumbStatus);
                    break;
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
                    System.out.println("추천비추천 상태2: "+thumbStatus);
                    break;
            }
        }
    }


    @Test
    void existsThumbUpAndDown() {

        final String THUMB_UP = "thumbUp";
        final String THUMB_DOWN = "thumbDown";
        final Integer countLikes = 1;
        final Integer countNoLikes = 1;

        //추천/비추천 테스트용
        //String thumbType = "thumbUp";        //테스트 옵션 1. 추천 테스트
        String thumbType = "thumbDown";    //테스트 옵션 2. 비추천 테스트

        Optional<Diary> maybeDiary = diaryRepository.findById((long) 4);
        Diary diary = maybeDiary.get();
        List<Integer> thumbStatus = new ArrayList<>();

        //DB에 추천/비추천 이력있는 멤버+게시글번호 넣기 - 테스트옵션 3. 아래 switch 케이스 추천/비추천 이력 별로 게시글No, 멤버No 지정
        Optional<Recommend> maybeRecommend = recommendRepository.findByDiaryAndMember((long)4, (long)2);
        System.out.println("메이비 Recommend: " + maybeRecommend.toString());

        if (!maybeRecommend.equals(Optional.empty())) {
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
                        System.out.println("추천비추천 상태3: "+ thumbStatus);
                        break;
                    } else {
                        // 2) 추천이력 있는 경우 -> 추천 취소됨
                        thumbStatus.add(diary.getLikes() - countLikes);
                        thumbStatus.add(diary.getNoLikes());
                        diary.setLikes(diary.getLikes() - countLikes);
                        recommend.setThumbUpFlag(false);
                        recommendRepository.save(recommend);
                        diaryRepository.save(diary);
                        System.out.println("추천비추천 상태4:"+thumbStatus);
                        break;
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
                        System.out.println("추천비추천 상태5: "+thumbStatus);
                        break;
                    } else{
                        // 4) 비추천이력 있는 경우 -> 비추천 취소
                        thumbStatus.add(diary.getLikes());
                        thumbStatus.add(diary.getNoLikes() - countNoLikes);
                        diary.setNoLikes(diary.getNoLikes() - countNoLikes);
                        diaryRepository.save(diary);
                        recommend.setThumbDownFlag(false);
                        recommendRepository.save(recommend);
                        System.out.println("추천비추천 상태6: "+thumbStatus);
                        break;
                    }
            }
        }
    }

}
