package kr.eddi.demo.service.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.ArcherBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.FreeBoardRequest;
import kr.eddi.demo.entity.jpa.boards.ArcherBoard;
import kr.eddi.demo.entity.jpa.boards.FreeBoard;

import java.util.List;

public interface ArcherBoardService {
    public void register(ArcherBoardRequest boardRequest);
    public List<ArcherBoard> list();
    public ArcherBoard read(Long boardNo);
    public void modify(ArcherBoard board);
    public void remove(Long boardNo);
}
