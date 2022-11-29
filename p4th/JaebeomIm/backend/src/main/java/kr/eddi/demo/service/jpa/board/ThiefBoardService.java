package kr.eddi.demo.service.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.PirateBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.ThiefBoardRequest;
import kr.eddi.demo.entity.jpa.boards.PirateBoard;
import kr.eddi.demo.entity.jpa.boards.ThiefBoard;

import java.util.List;

public interface ThiefBoardService {
    public void register(ThiefBoardRequest boardRequest);
    public List<ThiefBoard> list();
    public ThiefBoard read(Long boardNo);
    public void modify(ThiefBoard board);
    public void remove(Long boardNo);
}
