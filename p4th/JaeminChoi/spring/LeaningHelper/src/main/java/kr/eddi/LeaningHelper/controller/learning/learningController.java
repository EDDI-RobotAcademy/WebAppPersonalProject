package kr.eddi.LeaningHelper.controller.learning;

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
        log.info("wordItemsRegister()" + wordItemsRegisterForm);
        return service.wordItemRegister(wordItemsRegisterForm.toWordItemsRequest());
    }

    @PostMapping("/check-subject/{subject}")
    public long wordDegreeCnt(@PathVariable("subject")  long subject){
        return service.readWordDegreeCnt();
    }

    @PostMapping("/get-wordsList/{degree}")
    public List<WordResponseForm> wordsItemList(@PathVariable("degree") long degree ){
        return service.readWordItems(degree);
    }
}
