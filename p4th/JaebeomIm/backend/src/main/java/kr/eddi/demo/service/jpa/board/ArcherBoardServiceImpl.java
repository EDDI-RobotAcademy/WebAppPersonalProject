package kr.eddi.demo.service.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.ArcherBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.FreeBoardRequest;
import kr.eddi.demo.entity.jpa.boards.ArcherBoard;
import kr.eddi.demo.entity.jpa.boards.FreeBoard;
import kr.eddi.demo.repository.board.ArcherBoardRepository;
import kr.eddi.demo.repository.board.FreeBoardRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class ArcherBoardServiceImpl implements ArcherBoardService {

    @Autowired
    ArcherBoardRepository repository;

    @Override
    public void register(ArcherBoardRequest boardRequest) {
        ArcherBoard board = new ArcherBoard();
        board.setTitle(boardRequest.getTitle());
        board.setContent(boardRequest.getContent());
        board.setWriter(boardRequest.getWriter());

        repository.save(board);
    }

    @Override
    public List<ArcherBoard> list() {
        return repository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    }

    @Override
    public ArcherBoard read(Long boardNo) {
        Optional<ArcherBoard> maybeBoard = repository.findById(boardNo);

        if (maybeBoard.equals(Optional.empty())) {
            log.info("Can't read board!!!");
            return null;
        }

        return maybeBoard.get();
    }

    @Override
    public void modify(ArcherBoard board) {
        repository.save(board);
    }

    @Override
    public void remove(Long boardNo) {
        repository.deleteById(boardNo);
    }
}
