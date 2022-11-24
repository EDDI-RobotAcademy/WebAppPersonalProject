package kr.pjj.demo;

import kr.pjj.demo.entity.board.Comment;
import kr.pjj.demo.entity.board.Diary;
import kr.pjj.demo.entity.board.response.CommentResponse;
import kr.pjj.demo.repository.board.CommentRepository;
import kr.pjj.demo.repository.board.DiaryRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@SpringBootTest
public class CommentTestCase {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private DiaryRepository diaryRepository;

    @Test
    void createBoard(){
        Diary diary = new Diary( "오운완", "public", "wow");
        diaryRepository.save(diary);

    }

    @Test
    void createComment() {
        Optional<Diary> maybeDiary = diaryRepository.findById((long) 9);
        Diary diary = maybeDiary.get();

        Comment comment = Comment.builder()
                .writerNickname("알밤동동")
                .content("so good!")
                .diary(diary)
                .parentsCommentId((long)0)
                .build();

        diaryRepository.save(diary);

        commentRepository.save(comment);
    }


    // 9번 게시글의 모든 댓글 리스트 UI로 전달 -> 댓글 리스트 화면 보여주기
    @Test
    void findCommentsOnSpecificBoard () {
        List<Comment> commentList = commentRepository.findAllCommentsByBoardId((long) 1);
        List<CommentResponse> commentResponses = new ArrayList<>();

        for (Comment comment : commentList) {
            commentResponses.add(new CommentResponse(comment.getContent()));
        }

        System.out.println(commentResponses);
    }

    @Test
    void modifyCommentsOnBoard () {
        Optional<Comment> maybeComment = commentRepository.findById((long) 30);
        Comment comment = maybeComment.get();

        Optional<Diary> maybeDiary = diaryRepository.findById((long)9);
        Diary diary = maybeDiary.get();

        String regDate = LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.SHORT));

        comment.setParentsCommentId((long)0);
        comment.setContent("wow im so happy");
        comment.setWriterNickname("헬로맨");
        comment.setDiary(diary);
        comment.setRegDate(regDate);

        commentRepository.save(comment);
    }

    //댓글 1개 삭제
    @Test
    void deleteCommentsOnBoard () {
        commentRepository.deleteById((long) 13);
    }

}
