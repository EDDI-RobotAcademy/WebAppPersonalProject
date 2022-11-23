package kr.eddi.LeaningHelper.controller.learning;

import kr.eddi.LeaningHelper.form.learningForm.WordItemModifyForm;
import kr.eddi.LeaningHelper.form.learningForm.WordItemsRegisterForm;
import kr.eddi.LeaningHelper.respones.learning.WordResponseForm;
import kr.eddi.LeaningHelper.service.learning.WordItemsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/learning")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class learningController {


    @Autowired
    WordItemsService service;

    @PostMapping("/words-register")
    public Boolean wordItemsRegister(@RequestBody WordItemsRegisterForm wordItemsRegisterForm){
        log.info("wordItemsRegister() " + wordItemsRegisterForm);
        return service.wordItemRegister(wordItemsRegisterForm.toWordItemsRequest());
    }


    @PostMapping("/get-wordsList/{degree}")
    public List<WordResponseForm> wordsItemList(@PathVariable("degree") int degree ){
        log.info("wordsItemList() " + degree);
        return service.readWordItems(degree);
    }

    @PostMapping("/words-modify")
    public Boolean wordsModify(@RequestBody WordItemModifyForm wordItemModifyForm){
        log.info("wordsModify() " + wordItemModifyForm);
        return service.ModifyWordItem(wordItemModifyForm.toWordItemsModifyRequest());
    }

    @PostMapping("/words-delete/{wordId}")
    public Boolean deleteModify(@PathVariable("wordId") int wordId){
        log.info("deleteModify() " + wordId);
        return service.deleteWordItems((long) wordId);
    }
}
