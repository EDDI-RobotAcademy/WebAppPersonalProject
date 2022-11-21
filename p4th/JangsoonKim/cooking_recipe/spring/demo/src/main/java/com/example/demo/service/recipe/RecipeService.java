package com.example.demo.service.recipe;

import com.example.demo.entity.board.Image;
import com.example.demo.entity.board.Recipe;
import com.example.demo.service.recipe.request.ModifyRequest;
import com.example.demo.service.recipe.request.RecipeRegisterRequest;

import java.util.List;

public interface RecipeService {
    public void register(RecipeRegisterRequest recipeRequest, List<String> uploadImageList);
    public List<Recipe> list();
    public List<Image> read(Long recipeNo);
    public void modify(Long recipeNo, ModifyRequest request);
    public void remove(Long recipeNo);
}
