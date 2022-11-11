package kr.eddi.LeaningHelper.controller.question;

import kr.eddi.LeaningHelper.form.questionForm.QuestionAnswerForm;
import kr.eddi.LeaningHelper.form.questionForm.QuestionRegisterForm;
import kr.eddi.LeaningHelper.service.question.QuestionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/question")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class QuestionController {

    @Autowired
    private QuestionService service;

    @PostMapping("/question-register")
    public Boolean questionRegister(@RequestBody QuestionRegisterForm questionRegisterForm){
        log.info("questionRegister()" + questionRegisterForm);

        return service.grammarQuestionRegister(questionRegisterForm.toQuestionRegisterRequest());
    }

    @PostMapping("/answer_register")
    public Boolean answerRegister(@RequestBody QuestionAnswerForm questionAnswerForm){
        log.info("answerRegister()" + questionAnswerForm);

        return service.grammarAnswerRegister(questionAnswerForm.toGrammarQuestion());
    }
}
