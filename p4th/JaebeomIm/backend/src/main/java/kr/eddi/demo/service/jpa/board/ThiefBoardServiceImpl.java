package kr.eddi.demo.service.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.PirateBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.ThiefBoardRequest;
import kr.eddi.demo.entity.jpa.boards.PirateBoard;
import kr.eddi.demo.entity.jpa.boards.ThiefBoard;
import kr.eddi.demo.repository.board.PirateBoardRepository;
import kr.eddi.demo.repository.board.ThiefBoardRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class ThiefBoardServiceImpl implements ThiefBoardService {

    @Autowired
    ThiefBoardRepository repository;

    @Override
    public void register(ThiefBoardRequest boardRequest) {

        ThiefBoard board = new ThiefBoard();
        board.setTitle(boardRequest.getTitle());
        board.setContent(boardRequest.getContent());
        board.setWriter(boardRequest.getWriter());

        repository.save(board);
    }

    @Override
    public List<ThiefBoard> list() {
        return repository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    }

    @Override
    public ThiefBoard read(Long boardNo) {
        Optional<ThiefBoard> maybeBoard = repository.findById(boardNo);

        if (maybeBoard.equals(Optional.empty())) {
            log.info("Can't read board!!!");
            return null;
        }

        return maybeBoard.get();
    }

    @Override
    public void modify(ThiefBoard board) {
        repository.save(board);
    }

    @Override
    public void remove(Long boardNo) {
        repository.deleteById(boardNo);
    }
}
