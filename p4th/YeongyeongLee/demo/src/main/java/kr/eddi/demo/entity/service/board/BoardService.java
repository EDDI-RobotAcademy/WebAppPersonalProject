package kr.eddi.demo.entity.service.board;

import kr.eddi.demo.controller.board.request.BoardRequest;
import kr.eddi.demo.entity.boards.Board;

import java.util.List;

public interface BoardService {

    public void register(BoardRequest boardRequest);
    public List<Board> list();
    public Board read(Long boardNo);
    public void modify(Board board);
    public void remove(Long boardNo);

}
