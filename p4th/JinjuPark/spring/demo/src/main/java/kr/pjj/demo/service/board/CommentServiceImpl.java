package kr.pjj.demo.service.board;

import kr.pjj.demo.controller.board.request.CommentModify;
import kr.pjj.demo.controller.board.request.CommentRequest;
import kr.pjj.demo.entity.board.Comment;
import kr.pjj.demo.entity.board.Diary;
import kr.pjj.demo.repository.board.CommentRepository;
import kr.pjj.demo.repository.board.DiaryRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class CommentServiceImpl implements CommentService{

    @Autowired
    CommentRepository commentRepository;

    @Autowired
    DiaryRepository diaryRepository;

    @Override
    public void register(CommentRequest commentRequest) {
        Long boardNo = commentRequest.getBoardNo();
        String writerNickname = commentRequest.getWriterNickname();
        Long writerId = commentRequest.getWriterId();
        Long parentsId = commentRequest.getParentsCommentId();
        String inputComment = commentRequest.getContent();

        Optional<Diary> maybeDiary = diaryRepository.findById(boardNo);
        Diary diary = maybeDiary.get();

        Comment comment = Comment.builder()
                .writerNickname(writerNickname)
                .writerId(writerId)
                .content(inputComment)
                .diary(diary)
                .parentsCommentId(parentsId)
                .build();

        commentRepository.save(comment);
    }

    @Override
    public List<Comment> read(Long boardNo){
        List<Comment> commentList = commentRepository.findAllCommentsByBoardId(boardNo);
        return commentList;
    }

    @Override
    public void modify(Long commentId, CommentModify commentModify){
        Optional<Comment> maybeComment = commentRepository.findById(commentId);
        Comment comment = maybeComment.get();

        Optional<Diary> maybeDiary = diaryRepository.findById(commentModify.getBoardNo());
        Diary diary = maybeDiary.get();

        String regDate = LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.SHORT));

        comment.setParentsCommentId(commentModify.getParentsCommentId());
        comment.setContent(commentModify.getContent());
        comment.setWriterId(commentModify.getWriterId());
        comment.setWriterNickname(commentModify.getWriterNickname());
        comment.setDiary(diary);
        comment.setRegDate(regDate);

        commentRepository.save(comment);
    }

    @Override
    public void remove(Long commentId) {
        commentRepository.deleteById(commentId);
    }
}
