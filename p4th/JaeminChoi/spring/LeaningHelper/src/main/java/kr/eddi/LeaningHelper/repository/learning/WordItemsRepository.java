package kr.eddi.LeaningHelper.repository.learning;

import kr.eddi.LeaningHelper.entity.learning.words.WordItems;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface WordItemsRepository extends JpaRepository<WordItems, Long> {
    @Query("select w from WordItems w join w.wordsDegree dg where dg.wordsDegreeId = :degree")
    List<WordItems> findAllWordByDegree(Long degree);
}
