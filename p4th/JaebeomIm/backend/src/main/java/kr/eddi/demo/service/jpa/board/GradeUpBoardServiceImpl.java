package kr.eddi.demo.service.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.GradeUpBoardRequest;
import kr.eddi.demo.entity.jpa.boards.GradeUpBoard;
import kr.eddi.demo.repository.board.GradeUpBoardRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class GradeUpBoardServiceImpl implements GradeUpBoardService {

    @Autowired
    GradeUpBoardRepository repository;

    @Override
    public void register(GradeUpBoardRequest boardRequest) {
        GradeUpBoard board = new GradeUpBoard();
        board.setTitle(boardRequest.getTitle());
        board.setContent(boardRequest.getContent());
        board.setWriter(boardRequest.getWriter());

        repository.save(board);
    }

    @Override
    public List<GradeUpBoard> list() {
        return repository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    }

    @Override
    public GradeUpBoard read(Long boardNo) {
        Optional<GradeUpBoard> maybeBoard = repository.findById(boardNo);

        if (maybeBoard.equals(Optional.empty())) {
            log.info("Can't read board!!!");
            return null;
        }

        return maybeBoard.get();
    }

    @Override
    public void modify(GradeUpBoard board) {
        repository.save(board);
    }

    @Override
    public void remove(Long boardNo) {
        repository.deleteById(boardNo);
    }
}
