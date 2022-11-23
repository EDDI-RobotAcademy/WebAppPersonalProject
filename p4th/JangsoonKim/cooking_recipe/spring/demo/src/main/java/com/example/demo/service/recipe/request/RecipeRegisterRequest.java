package com.example.demo.service.recipe.request;

import com.example.demo.entity.board.Recipe;
import com.example.demo.entity.member.Member;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import java.util.List;

@Getter
@ToString
@RequiredArgsConstructor
public class RecipeRegisterRequest {

    private final String title;
    private final String category;
    private final String content;
    private final String writer;

    public Recipe toRecipe() {
        return new Recipe(title, category, content, writer);
    }
}
