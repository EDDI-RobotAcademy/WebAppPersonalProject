package com.example.backend.service.board.request;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class BoardModifyRequest {
    private final String title;
    private final String content;
}
