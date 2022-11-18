package kr.eddi.LeaningHelper.form.questionForm;

import kr.eddi.LeaningHelper.entity.question.grammar.GrammarQuestion;
import kr.eddi.LeaningHelper.request.question.QuestionAnswerRequest;
import lombok.Data;

@Data
public class QuestionAnswerForm {
    private Long StudentAnswer;

    public QuestionAnswerRequest toGrammarQuestion(){
        return  new QuestionAnswerRequest(StudentAnswer);
    }


//    public LogicQuestion toLogicQuestion(){
//        return  new LogicQuestion(
//                StudentAnswer
//        );
//    } 4개 생성하기
}
