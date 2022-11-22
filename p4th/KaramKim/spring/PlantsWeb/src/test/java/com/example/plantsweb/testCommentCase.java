package com.example.plantsweb;

import com.example.plantsweb.entity.board.Comment;
import com.example.plantsweb.entity.board.QuestionBoard;
import com.example.plantsweb.repository.board.CommentRepository;
import com.example.plantsweb.repository.board.QuestionBoardRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

@SpringBootTest
public class testCommentCase {

    @Autowired
    private QuestionBoardRepository questionBoardRepository;

    @Autowired
    private CommentRepository commentRepository;

    @Test
    void writeComment() {
        Optional<QuestionBoard> maybeBoard = questionBoardRepository.findById((long) 2);
        QuestionBoard board = maybeBoard.get();

        Comment comment = Comment.builder()
                .writer("빌더 테스트")
                .content("빌더 사용 테스트 댓글")
                .questionBoard(board)
                .build();
        commentRepository.save(comment);
    }
}
