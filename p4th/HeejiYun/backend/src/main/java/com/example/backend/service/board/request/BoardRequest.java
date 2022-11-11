package com.example.backend.service.board.request;

import com.example.backend.entity.board.Board;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public class BoardRequest {
    private final String title;
    private final String writer;
    private final String content;
    private final String boardCategoryName;

    public Board toBoard() { return new Board(title, writer, content); }
}
