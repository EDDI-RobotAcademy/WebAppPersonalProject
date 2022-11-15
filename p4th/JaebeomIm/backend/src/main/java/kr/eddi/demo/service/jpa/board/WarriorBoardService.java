package kr.eddi.demo.service.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.ThiefBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.WarriorBoardRequest;
import kr.eddi.demo.entity.jpa.boards.ThiefBoard;
import kr.eddi.demo.entity.jpa.boards.WarriorBoard;

import java.util.List;

public interface WarriorBoardService {
    public void register(WarriorBoardRequest boardRequest);
    public List<WarriorBoard> list();
    public WarriorBoard read(Long boardNo);
    public void modify(WarriorBoard board);
    public void remove(Long boardNo);
}
