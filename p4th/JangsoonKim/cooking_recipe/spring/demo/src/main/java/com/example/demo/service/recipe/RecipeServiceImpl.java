package com.example.demo.service.recipe;

import com.example.demo.entity.board.Image;
import com.example.demo.entity.board.Recipe;
import com.example.demo.repository.image.ImageListRepository;
import com.example.demo.repository.recipe.RecipeRepository;
import com.example.demo.service.recipe.request.ModifyRequest;
import com.example.demo.service.recipe.request.RecipeRegisterRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class RecipeServiceImpl implements RecipeService {

    @Autowired
    RecipeRepository repository;

    @Autowired
    ImageListRepository imagesRepository;

    @Override
    public void register(RecipeRegisterRequest recipeRequest, List<String> uploadImageList){
        Recipe recipe = new Recipe();
        recipe.setTitle(recipeRequest.getTitle());
        recipe.setCategory(recipeRequest.getCategory());
        recipe.setKeyword(recipeRequest.getCategory()+recipeRequest.getTitle());
        recipe.setContent(recipeRequest.getContent());
        recipe.setWriter(recipeRequest.getWriter());
        recipe.setThumbnail(uploadImageList.get(0));
        recipe.setRating(0);
        recipe.setLikeCount(0);

        repository.save(recipe);

        Optional<Recipe> maybeRecipe = repository.findBySeveralOption(
                recipeRequest.getTitle(),
                recipeRequest.getWriter(),
                recipeRequest.getContent()
        );

        Recipe tmpRecipe = maybeRecipe.get();

        for (int i = 0; i < uploadImageList.size(); i++) {
            Image image = Image.builder()
                    .imagePath(uploadImageList.get(i))
                    .recipe(tmpRecipe)
                    .build();
            imagesRepository.save(image);
        }


    }

    @Override
    public List<Recipe> list(){
        List<Recipe> tmpList = repository.findAll(Sort.by(Sort.Direction.DESC, "recipeNo"));

        log.info("모든 레시피 리스트: "+String.valueOf(tmpList));

        return tmpList;
    }

    @Override
    public List<Image> read(Long recipeNo) {
        Optional<Recipe> maybeBoard = repository.findById(recipeNo);

        List<Image> imgList;
        if (maybeBoard.equals(Optional.empty())) {
            log.info("없어요!!!");
            return null;
        } else {
            imgList = maybeBoard.get().getImages();
            log.info(String.valueOf(imgList));
        }

        return imgList;
    }

    @Override
    public void modify(Long recipeNo, ModifyRequest request){
        Optional<Recipe> maybeBoard = repository.findById(recipeNo);

        if(maybeBoard.isPresent()){
            Recipe recipe = maybeBoard.get();

            recipe.setTitle(request.getTitle());
            recipe.setCategory(request.getCategory());
            recipe.setContent(request.getContent());

            repository.save(recipe);

        } else {
            log.info("수정 실패!!!");
        }

    }

    @Override
    public void remove(Long recipeNo){
        List<Image> imageList = imagesRepository.findAllImagesByRecipeNo(recipeNo);

        for(Image image: imageList){
            imagesRepository.delete(image);
        }

        repository.deleteById(recipeNo);
    }
}
