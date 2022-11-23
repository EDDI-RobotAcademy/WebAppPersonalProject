package kr.eddi.LeaningHelper.repository.learning;

import kr.eddi.LeaningHelper.entity.learning.words.WordItems;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface WordItemsRepository extends JpaRepository<WordItems, Long> {
    @Query("select w from WordItems w join w.wordsDegree dg where dg.Degree = :degree")
    List<WordItems> findAllWordByDegree(Long degree);

    @Query("select w from WordItems w where w.word = :word")
    Optional<WordItems> findItemByWordName(String word);

    @Query("select w.id from WordItems w where w.word = :word")
    Long findIdByWordName(String word);
}
