package kr.eddi.LeaningHelper.form.questionForm;


import kr.eddi.LeaningHelper.request.question.QuestionRegisterRequest;
import lombok.Data;

@Data
public class QuestionRegisterForm {

    private String Title;

    private String BodyOfQuestion;

    private Long rightAnswer;

    private String explanation;

    public QuestionRegisterRequest toQuestionRegisterRequest(){
        return new QuestionRegisterRequest(Title,BodyOfQuestion,rightAnswer,explanation);
    }

}
