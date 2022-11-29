package kr.eddi.demo.service.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.FreeBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.QuestionBoardRequest;
import kr.eddi.demo.entity.jpa.boards.FreeBoard;
import kr.eddi.demo.entity.jpa.boards.QuestionBoard;
import kr.eddi.demo.repository.board.FreeBoardRepository;
import kr.eddi.demo.repository.board.QuestionBoardRepository;
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

    @Override
    public void register(QuestionBoardRequest boardRequest) {
        QuestionBoard board = new QuestionBoard();
        board.setTitle(boardRequest.getTitle());
        board.setContent(boardRequest.getContent());
        board.setWriter(boardRequest.getWriter());

        repository.save(board);
    }

    @Override
    public List<QuestionBoard> list() {
        return repository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    }

    @Override
    public QuestionBoard read(Long boardNo) {
        Optional<QuestionBoard> maybeBoard = repository.findById(boardNo);

        if (maybeBoard.equals(Optional.empty())) {
            log.info("Can't read board!!!");
            return null;
        }

        return maybeBoard.get();
    }

    @Override
    public void modify(QuestionBoard board) {
        repository.save(board);
    }

    @Override
    public void remove(Long boardNo) {
        repository.deleteById(boardNo);
    }
}
