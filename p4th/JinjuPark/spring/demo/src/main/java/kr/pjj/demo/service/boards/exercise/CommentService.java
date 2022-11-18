package kr.pjj.demo.service.boards.exercise;

import kr.pjj.demo.controller.member.boards.exercise.request.CommentModify;
import kr.pjj.demo.controller.member.boards.exercise.request.CommentRequest;
import kr.pjj.demo.entity.boards.exercise.Comment;
import kr.pjj.demo.entity.boards.exercise.Diary;

import java.util.List;

public interface CommentService {

    public void register(CommentRequest commentRequest);

    public List<Comment> read(Long boardNo);

    public void modify(Long commentId, CommentModify commentModify);

    public void remove(Long commentId);


    // 대댓글은 CommentRepository에서 쿼리 추가해서
    //diary,boardNo와 comment.id를 종합해서 달아야할듯?
}
