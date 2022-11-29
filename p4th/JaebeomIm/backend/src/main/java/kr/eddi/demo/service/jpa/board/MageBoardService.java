package kr.eddi.demo.service.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.ArcherBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.MageBoardRequest;
import kr.eddi.demo.entity.jpa.boards.ArcherBoard;
import kr.eddi.demo.entity.jpa.boards.MageBoard;

import java.util.List;

public interface MageBoardService {
    public void register(MageBoardRequest boardRequest);
    public List<MageBoard> list();
    public MageBoard read(Long boardNo);
    public void modify(MageBoard board);
    public void remove(Long boardNo);
}