package com.example.backend.service.board;

import com.example.backend.entity.board.Board;
import com.example.backend.service.board.request.BoardRequest;

import java.util.List;

public interface BoardService {

    public void register(BoardRequest boardRequest);
    public List<Board> everyBoardList();
    public List<Board> specificBoardList(String categoryName);
    public Board read(Long boardNo);
    public void modify(Board board);
    public void remove(Long boardNo);
}
