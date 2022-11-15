package kr.eddi.demo.service.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.ThiefBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.WarriorBoardRequest;
import kr.eddi.demo.entity.jpa.boards.ThiefBoard;
import kr.eddi.demo.entity.jpa.boards.WarriorBoard;
import kr.eddi.demo.repository.board.ThiefBoardRepository;
import kr.eddi.demo.repository.board.WarriorBoardRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class WarriorBoardServiceImpl implements WarriorBoardService {

    @Autowired
    WarriorBoardRepository repository;

    @Override
    public void register(WarriorBoardRequest boardRequest) {

        WarriorBoard board = new WarriorBoard();
        board.setTitle(boardRequest.getTitle());
        board.setContent(boardRequest.getContent());
        board.setWriter(boardRequest.getWriter());

        repository.save(board);
    }

    @Override
    public List<WarriorBoard> list() {
        return repository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    }

    @Override
    public WarriorBoard read(Long boardNo) {
        Optional<WarriorBoard> maybeBoard = repository.findById(boardNo);

        if (maybeBoard.equals(Optional.empty())) {
            log.info("Can't read board!!!");
            return null;
        }

        return maybeBoard.get();
    }

    @Override
    public void modify(WarriorBoard board) {
        repository.save(board);
    }

    @Override
    public void remove(Long boardNo) {
        repository.deleteById(boardNo);
    }
}