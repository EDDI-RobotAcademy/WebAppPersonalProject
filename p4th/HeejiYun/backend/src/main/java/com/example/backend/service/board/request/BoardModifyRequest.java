package com.example.backend.service.board.request;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class BoardModifyRequest {
    private String title;
    private String content;
}
