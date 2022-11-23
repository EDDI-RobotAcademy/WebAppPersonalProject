package com.example.demo.service.recipe.request;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public class CommentModifyRequest {

    private final String content;
    private final Long contentNo;

}
