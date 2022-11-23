package com.example.demo.service.recipe;

import com.example.demo.entity.board.Comment;
import com.example.demo.entity.board.Recipe;
import com.example.demo.repository.recipe.CommentRepository;
import com.example.demo.repository.recipe.RecipeRepository;
import com.example.demo.service.recipe.request.CommentModifyRequest;
import com.example.demo.service.recipe.request.CommentRegisterRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private RecipeRepository recipeRepository;

    @Override
    public void register(CommentRegisterRequest commentRegisterRequest) {
        Long recipeNo = commentRegisterRequest.getRecipeNo();
        String writer = commentRegisterRequest.getWriter();
        String content = commentRegisterRequest.getContent();

        Optional<Recipe> maybeRecipe = recipeRepository.findById(recipeNo);

        if (maybeRecipe.isPresent()) {
            Recipe recipe = maybeRecipe.get();

            Comment comment = Comment.builder()
                    .writer(writer)
                    .content(content)
                    .recipeNo(recipe.getRecipeNo())
                    .build();

            commentRepository.save(comment);
        } else {
            log.info("해당 레시피가 없습니다.");
        }
    }

    @Override
    public List<Comment> list(Long recipeNo) {
        List<Comment> commentList = commentRepository.findAllCommentsByRecipeId(recipeNo);

        log.info("해당 레시피 모든 댓글 리스트: "+String.valueOf(commentList));
        return commentList;
    }

    @Override
    public void modify(Long commentNo, CommentModifyRequest request) {
        Optional<Comment> maybeComment = commentRepository.findById(commentNo);

        if (maybeComment.isPresent()){
            Comment comment = maybeComment.get();
            comment.setContent(request.getContent());
            commentRepository.save(comment);
        }else {
            log.info("해당 댓글이 존재하지 않습니다.");
        }


    }

    @Override
    public void remove(Long commentNo) {
        commentRepository.deleteById(commentNo);
    }
}
