package com.example.backend.service.board.request;

import com.example.backend.entity.board.Board;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
public class BoardRegisterRequest {
    private String title;
    private String writer;
    private String content;
    private String boardCategoryName;

    public Board toBoard() { return new Board(title, writer, content); }
}
