package com.example.plantsweb.service.board;

import com.example.plantsweb.controller.board.request.BoardRequest;
import com.example.plantsweb.entity.board.Comment;
import com.example.plantsweb.entity.board.QuestionBoard;
import com.example.plantsweb.repository.board.CommentRepository;
import com.example.plantsweb.repository.board.QuestionBoardRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class QuestionBoardServiceImpl implements QuestionBoardService{

    @Autowired
    QuestionBoardRepository repository;

    @Autowired
    CommentRepository commentRepository;

    @Override
    public List<QuestionBoard> list() {
        return repository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    }

    @Override
    public void register(BoardRequest boardRequest) {
        QuestionBoard questionBoard = new QuestionBoard();
        questionBoard.setTitle(boardRequest.getTitle());
        questionBoard.setWriter(boardRequest.getWriter());
        questionBoard.setContent(boardRequest.getContent());

        repository.save(questionBoard);
    }

    @Override
    public QuestionBoard read(Long boardNo) {
        Optional<QuestionBoard> maybeBoard = repository.findById(boardNo);

        if(maybeBoard.equals(Optional.empty())) {
            log.info("게시물을 읽을 수 없습니다.");
            return null;
        }
        return maybeBoard.get();
    }

    @Override
    public void modify(QuestionBoard questionBoard) {
        repository.save(questionBoard);
    }

    @Override
    public void delete(Long boardNo) {
        List<Comment> commentList = commentRepository.findAllCommentsByBoardId(boardNo);

        for (Comment comment : commentList) {
            commentRepository.delete(comment);
        }

        repository.deleteById(boardNo);
    }
}
