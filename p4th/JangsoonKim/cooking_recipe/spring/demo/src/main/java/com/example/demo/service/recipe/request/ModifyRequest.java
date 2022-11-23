package com.example.demo.service.recipe.request;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public class ModifyRequest {

    private final String title;
    private final String category;
    private final String content;
    private final Long recipeNo;


}
