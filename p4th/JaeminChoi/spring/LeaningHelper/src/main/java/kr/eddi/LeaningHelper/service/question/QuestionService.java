package kr.eddi.LeaningHelper.service.question;

import kr.eddi.LeaningHelper.request.question.QuestionAnswerRequest;
import kr.eddi.LeaningHelper.request.question.QuestionRegisterRequest;

public interface QuestionService {

    public Boolean grammarQuestionRegister(QuestionRegisterRequest request);

    // public Boolean LogicQuestionRegister(QuestionRegisterRequest request);

    public Boolean grammarAnswerRegister(QuestionAnswerRequest request);

    public Boolean checkAnswer(String title);

}
