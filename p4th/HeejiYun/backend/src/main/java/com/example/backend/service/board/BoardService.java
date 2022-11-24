package com.example.backend.service.board;

import com.example.backend.service.board.request.BoardModifyRequest;
import com.example.backend.service.board.request.BoardRegisterRequest;
import com.example.backend.service.board.response.BoardResponse;

import java.util.List;

public interface BoardService {

    public boolean register(BoardRegisterRequest boardRegisterRequest);
    public List<BoardResponse> everyBoardList();
    public List<BoardResponse> specificBoardList(String categoryName);
    public BoardResponse read(Long boardNo);
    public BoardResponse modify(Long boardNo, BoardModifyRequest boardModifyRequest);
    public void remove(Long boardNo);
}
