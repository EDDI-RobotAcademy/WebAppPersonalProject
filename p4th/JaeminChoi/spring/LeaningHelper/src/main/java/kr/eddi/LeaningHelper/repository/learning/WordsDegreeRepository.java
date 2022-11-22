package kr.eddi.LeaningHelper.repository.learning;

import kr.eddi.LeaningHelper.entity.learning.words.WordsDegree;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface WordsDegreeRepository extends JpaRepository<WordsDegree,Long> {
    @Query("select d from WordsDegree d where d.Degree = :degree")
    Optional<WordsDegree> findDegreeByResponseDegree(Long degree);

    @Query("select d from WordsDegree d where d.Degree = :degree")
    List<WordsDegree> findAllDegree();
}
