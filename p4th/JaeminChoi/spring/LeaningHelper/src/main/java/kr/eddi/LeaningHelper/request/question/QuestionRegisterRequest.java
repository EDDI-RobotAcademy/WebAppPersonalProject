package kr.eddi.LeaningHelper.request.question;

import kr.eddi.LeaningHelper.entity.question.grammar.GrammarQuestion;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Data
@ToString
@RequiredArgsConstructor
public class QuestionRegisterRequest {

    private final String Title;

    private final String BodyOfQuestion;

    private final Long rightAnswer;

    private final String explanation;

    public GrammarQuestion toGrammarQuestion(){
        return new GrammarQuestion(
                Title,
                BodyOfQuestion,
                rightAnswer,
                explanation
        );
    }

//    public LogicQuestion toLogicQuestion(){
//        return new LogicQuestion(
//                Title,
//                BodyOfQuestion,
//                rightAnswer,
//                explanation
//        );
//    }
}
