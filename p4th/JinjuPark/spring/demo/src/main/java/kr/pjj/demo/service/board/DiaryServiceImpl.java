package kr.pjj.demo.service.board;

import kr.pjj.demo.controller.board.request.DiaryModify;
import kr.pjj.demo.controller.board.request.DiaryRequest;
import kr.pjj.demo.entity.board.*;
import kr.pjj.demo.entity.member.Member;
import kr.pjj.demo.repository.board.*;
import kr.pjj.demo.repository.member.MemberRepository;
import kr.pjj.demo.service.security.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Slf4j
@Service
public class DiaryServiceImpl implements DiaryService{

    @Autowired
    DiaryRepository repository;

    @Autowired
    RedisService redisService;

    @Autowired
    MemberRepository memberRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    CommentRepository commentRepository;

    @Autowired
    RecommendRepository recommendRepository;

    @Autowired
    ImageRepository imageRepository;

    final Long WORK_DIARY = 1L;
    final Long FREE_BOARD = 2L;
    final Long QNA_BOARD = 3L;

    //공개 비공개 - 컨셉 : 비공개글은 본인 마이페이지에서만 보기 -> 전체에 공개조건 1개만 추가 
    // -> 비공개 게시글은 마이페이지 조회 시 보이는 걸로 구성
    
    //전체게시판 리스트 출력 
    @Override
    public List<Diary> AllList() {
       return repository.findDiaryByPublicBoardNoDesc();
    }

    //페이지별 게시판 리스트 출력
    @Override
    public List<Diary> pageDiaryList(Long pageNo) {

        return repository.findDiaryByPublicAndPageNoOrderByBoardNoDesc(pageNo);

    }

    //검색 기능
    @Override
    public List<Diary> search(Long pageNo, String keyword) {
        log.info("검색키워드: "+keyword);
        List<Diary> searchPageList = null;

        if (pageNo == 0) {
            searchPageList = repository.findDiaryByPublicAndTitleContaining(keyword, keyword);
            log.info("전체검색 실행됨");
        } else if (pageNo == 1) {
            searchPageList = repository.findDiaryByPageNoAndTitleContaining(pageNo, keyword, keyword);
        } else if (pageNo == 2) {
            searchPageList = repository.findDiaryByPageNoAndTitleContaining(pageNo, keyword, keyword);
        } else if (pageNo == 3) {
            searchPageList = repository.findDiaryByPageNoAndTitleContaining(pageNo, keyword, keyword);
    }

        return searchPageList;
    }

    public List<Diary> MyDiaryList(Long memberId) {
        return repository.findMyDiaryByMemberIdOrderByBoardNoDesc(memberId);
    }

    @Override
    public void register(DiaryRequest diaryRequest) {

        registerDiaryContents(diaryRequest);
    }

    @Override
    public void registerWithFiles(List<MultipartFile> fileList, DiaryRequest diaryRequest) {

            Diary diary = registerDiaryContents(diaryRequest);

            // 실제 파일 frontend 이미지 폴더 경로에 저장
            try {
                for (MultipartFile multipartFile: fileList) {
                    log.info("requestUploadFilesWithText() - Make file: " + multipartFile.getOriginalFilename());

                    UUID fileRandomName = UUID.randomUUID();

                    String fileReName = fileRandomName+multipartFile.getOriginalFilename();

                    //저장 경로 지정 + 파일네임
                    FileOutputStream writer = new FileOutputStream("../../vue/frontend/src/assets/uploadImgs/" + fileReName);
                    log.info("디렉토리에 파일 배치 성공!");

                    //파일 저장(저장할때는 byte 형식으로 저장해야 해서 파라미터로 받은 multipartFile 파일들의 getBytes() 메소드 적용해서 저장하는 듯)
                    writer.write(multipartFile.getBytes());

                    //이미지 엔티티 값 셋팅
                    Image image = new Image();

                    image.setOriginalName(multipartFile.getOriginalFilename());
                    image.setReName(fileReName);
                    image.setDiary(diary);
                    imageRepository.save(image);

                    writer.close();


                }
            } catch (FileNotFoundException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
    }

    public Diary registerDiaryContents(DiaryRequest diaryRequest){
        Diary diary = new Diary();
        diary.setTitle(diaryRequest.getTitle());
        diary.setContent(diaryRequest.getContent());
        diary.setAuthority(diaryRequest.getAuthority());

        //조회수 0
        diary.setViews(0);
        //추천수, 비추천수 0
        diary.setLikes(0);
        diary.setNoLikes(0);

        Category category = new Category();

        if (diaryRequest.getCategory() == WORK_DIARY) {
            category.setCategoryName("운동일기");
            category.setPageNo((long)1);
            categoryRepository.save(category);
            diary.setCategory(category);
        } else if (diaryRequest.getCategory() == FREE_BOARD) {
            category.setCategoryName("자유게시판");
            category.setPageNo((long)2);
            categoryRepository.save(category);
            diary.setCategory(category);

        } else if (diaryRequest.getCategory() == QNA_BOARD) {
            category.setCategoryName("질문게시판");
            category.setPageNo((long)3);
            categoryRepository.save(category);
            diary.setCategory(category);
        }

        //1. 사용자 토큰 형식 변환
        String writerToken = diaryRequest.getWriterToken().substring(1,37);
        log.info("작성자 토큰: " + writerToken);
        //2. 사용자 토큰 이용해서 멤버 id 번호 구하기
        Long writerId = redisService.getValueByKey(writerToken);
        //3. 멤버 id로 사용자 닉네임 구하기
        Optional<Member> maybeMember = memberRepository.findById(writerId);
        log.info("멤버 아이디:" + writerId );
        Member member = maybeMember.get();
        //4. 멤버 닉네임 writer로 설정
        diary.setMember(member);
        log.info("작성자 닉네임: " + member.getNickname());
      return repository.save(diary);

    }

    @Override
    public Diary read(Long boardNo) {
        //findById 사용할 때는 Optional 사용 -> 객체가 Board 아닐 가능성도 있기때문에
        Optional<Diary> maybeDiary = repository.findById(boardNo);

        if (maybeDiary.equals(Optional.empty())) {
            log.info("Can't read board!!!");
            return null;
        }
            //조회수 카운트 기능 추가 부분
            Diary diary = maybeDiary.get();
            Integer countAdd = 1;
            diary.setViews(diary.getViews() + countAdd);

            repository.save(diary);

        return diary;
    }


    @Override
    public Diary modify(DiaryModify diaryModify) {
        Optional<Diary> maybeDiary = repository.findById(diaryModify.getBoardNo());
        if (maybeDiary.equals(Optional.empty())) {
            log.info("Can't modify board!!!");
        }
        Diary diary= maybeDiary.get();
        diary.setTitle(diaryModify.getTitle());
        diary.setContent(diaryModify.getContent());
        return repository.save(diary);
    }

    @Override
    public void remove(Long boardNo) {
        List<Comment> commentList = commentRepository.findAllCommentsByBoardId(boardNo);

        for (Comment comment : commentList) {
            commentRepository.delete(comment);
        }

        List<Recommend> recommendList = recommendRepository.findAllRecommendsByBoardId(boardNo);

        for (Recommend recommend : recommendList){
            recommendRepository.delete(recommend);
        }

        List<Image> imageList = imageRepository.findAllImagesByBoardId(boardNo);

        for (Image image : imageList){
            imageRepository.delete(image);
        }

        repository.deleteById(boardNo);
        categoryRepository.deleteById(boardNo); // 다이어리 먼저 지우고 카테고리 지워야 함
    }


}
