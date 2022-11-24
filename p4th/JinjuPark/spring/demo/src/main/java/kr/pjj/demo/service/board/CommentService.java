package kr.pjj.demo.service.board;

import kr.pjj.demo.controller.board.request.CommentModify;
import kr.pjj.demo.controller.board.request.CommentRequest;
import kr.pjj.demo.entity.board.Comment;

import java.util.List;

public interface CommentService {

    public void register(CommentRequest commentRequest);

    public List<Comment> read(Long boardNo);

    public void modify(Long commentId, CommentModify commentModify);

    public void remove(Long commentId);

}
