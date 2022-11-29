package kr.eddi.demo.service.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.MageBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.PirateBoardRequest;
import kr.eddi.demo.entity.jpa.boards.MageBoard;
import kr.eddi.demo.entity.jpa.boards.PirateBoard;

import java.util.List;

public interface PirateBoardService {
    public void register(PirateBoardRequest boardRequest);
    public List<PirateBoard> list();
    public PirateBoard read(Long boardNo);
    public void modify(PirateBoard board);
    public void remove(Long boardNo);
}
