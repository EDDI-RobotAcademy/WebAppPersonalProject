package com.example.demo.service.recipe.request;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public class CommentRegisterRequest {

    private final Long recipeNo;
    private final String writer;
    private final String content;

}
