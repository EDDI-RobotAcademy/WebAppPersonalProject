package com.example.demo.service.recipe;

import com.example.demo.entity.board.Comment;
import com.example.demo.entity.board.Recipe;
import com.example.demo.service.recipe.request.CommentModifyRequest;
import com.example.demo.service.recipe.request.CommentRegisterRequest;
import com.example.demo.service.recipe.request.ModifyRequest;
import com.example.demo.service.recipe.request.RecipeRegisterRequest;

import java.util.List;

public interface CommentService {
    public void register(CommentRegisterRequest commentRegisterRequest);
    public List<Comment> list(Long recipeNo);
    public void modify(Long commentNo, CommentModifyRequest request);
    public void remove(Long commentNo);
}
