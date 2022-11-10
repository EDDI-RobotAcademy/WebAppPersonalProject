package kr.eddi.LeaningHelper.repository.Question;

import kr.eddi.LeaningHelper.entity.question.grammar.GrammarQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface GrammarQuestionRepository extends JpaRepository<GrammarQuestion,Long> {
    @Query("select GQ from GrammarQuestion GQ where GQ.Title =:Title")
    Optional<GrammarQuestion> findByTitle(String Title); // 제목으로 해당 문제 찾기
}
