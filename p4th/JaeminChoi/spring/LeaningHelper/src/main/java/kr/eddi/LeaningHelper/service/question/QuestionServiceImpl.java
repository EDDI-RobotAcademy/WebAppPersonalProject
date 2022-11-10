package kr.eddi.LeaningHelper.service.question;

import kr.eddi.LeaningHelper.entity.question.grammar.GrammarQuestion;
import kr.eddi.LeaningHelper.repository.Question.GrammarQuestionRepository;
import kr.eddi.LeaningHelper.request.question.QuestionAnswerRequest;
import kr.eddi.LeaningHelper.request.question.QuestionRegisterRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Slf4j
@Service
public class QuestionServiceImpl implements QuestionService{

    @Autowired
    GrammarQuestionRepository grammarRepository;



    @Override
    public Boolean grammarQuestionRegister(QuestionRegisterRequest questionRequest) {

        final GrammarQuestion Question = questionRequest.toGrammarQuestion();
        grammarRepository.save(Question);

        return true;
    }

//    @Override
//    public Boolean LogicQuestionRegister(QuestionRegisterRequest request) {
//
//        final GrammarQuestion Question = request.toLogicQuestion();
//        grammarRepository.save(Question);
//
//        return true;
//    }

    @Override
    public Boolean grammarAnswerRegister(QuestionAnswerRequest answerRequest) {

        final GrammarQuestion Answer = answerRequest.toGrammarQuestion();

        grammarRepository.save(Answer);
        return null;
    }

    @Override
    public Boolean checkAnswer(String title) {
        Optional<GrammarQuestion> maybeQuestion = grammarRepository.findByTitle(title);

        if (maybeQuestion.isPresent()){
            GrammarQuestion question = maybeQuestion.get();

            log.info("question title" + question.getTitle());
            log.info("question rightAnswer" + question.getRightAnswer());
            log.info("student answer" + question.getStudentAnswer());

            if (question.getRightAnswer() == question.getStudentAnswer()) {
                log.info("정답 입니다.");
                return true;
            }else {
                log.info("오답 입니다.");
                return false;
            }
        }
        throw new RuntimeException("어디선가 잘못 되었는데?");
    }
}
