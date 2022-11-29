package kr.eddi.demo.service.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.FreeBoardRequest;
import kr.eddi.demo.controller.jpa.board.request.GradeUpBoardRequest;
import kr.eddi.demo.entity.jpa.boards.GradeUpBoard;


import java.util.List;

public interface GradeUpBoardService {
    public void register(GradeUpBoardRequest boardRequest);
    public List<GradeUpBoard> list();
    public GradeUpBoard read(Long boardNo);
    public void modify(GradeUpBoard board);
    public void remove(Long boardNo);
}

