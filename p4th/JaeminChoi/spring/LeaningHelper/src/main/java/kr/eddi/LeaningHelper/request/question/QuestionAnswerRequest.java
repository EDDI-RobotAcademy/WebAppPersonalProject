package kr.eddi.LeaningHelper.request.question;

import kr.eddi.LeaningHelper.entity.question.grammar.GrammarQuestion;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Data
@ToString
@RequiredArgsConstructor
public class QuestionAnswerRequest {

    private final Long StudentAnswer;

    public GrammarQuestion toGrammarQuestion(){
        return new GrammarQuestion(
                StudentAnswer
        );
    }

}
