package com.example.backend.service.board;

import com.example.backend.entity.board.Board;
import com.example.backend.service.board.request.BoardModifyRequest;
import com.example.backend.service.board.request.BoardRegisterRequest;

import java.util.List;

public interface BoardService {

    public void register(BoardRegisterRequest boardRegisterRequest);
    public List<Board> everyBoardList();
    public List<Board> specificBoardList(String categoryName);
    public Board read(Long boardNo);
    public Board modify(Long boardNo, BoardModifyRequest boardModifyRequest);
    public void remove(Long boardNo);
}
