package com.example.plantsweb.service.board;

import com.example.plantsweb.controller.board.request.CommentRequest;
import com.example.plantsweb.entity.board.Comment;
import com.example.plantsweb.entity.board.QuestionBoard;
import com.example.plantsweb.repository.board.CommentRepository;
import com.example.plantsweb.repository.board.QuestionBoardRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private QuestionBoardRepository questionBoardRepository;

    @Override
    public List<Comment> list(Long boardNo) {
        return commentRepository.findAllCommentsByBoardId(boardNo);
    }

    @Override
    public void register(Long boardNo, CommentRequest commentRequest) {
        Optional<QuestionBoard> maybeBoard = questionBoardRepository.findById(boardNo);
        QuestionBoard questionBoard = maybeBoard.get();

        Comment comment = new Comment();
        comment.setQuestionBoard(questionBoard);
        comment.setWriter(commentRequest.getWriter());
        comment.setContent(commentRequest.getContent());

        commentRepository.save(comment);
    }

//    @Override
//    public void modify(Long boardNo, Comment comment) {
//        Optional<QuestionBoard> maybeBoard = questionBoardRepository.findById(boardNo);
//        QuestionBoard questionBoard = maybeBoard.get();
//
//        comment.setQuestionBoard(questionBoard);
//
//        commentRepository.save(comment);
//    }

    @Override
    public void modify(Long id, CommentRequest commentRequest) {
        Optional<Comment> maybeComment = commentRepository.findById(id);
        Comment comment = maybeComment.get();

        comment.modifyContent(commentRequest.getContent());

        commentRepository.save(comment);
    }

    @Override
    public void delete(Long id) {
        commentRepository.deleteById(id);
    }



//    @Override
//    public void writeComment(Long boardNo) {
//        Optional<QuestionBoard> maybeBoard = questionBoardRepository.findById(boardNo);
//        QuestionBoard questionBoard = maybeBoard.get();
//
//        commentRepository.save(comment);
//    }



}
