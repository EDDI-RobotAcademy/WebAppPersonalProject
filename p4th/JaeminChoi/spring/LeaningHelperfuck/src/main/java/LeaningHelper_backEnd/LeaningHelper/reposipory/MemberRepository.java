package LeaningHelper_backEnd.LeaningHelper.reposipory;

import LeaningHelper_backEnd.LeaningHelper.entity.Member.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;


public interface MemberRepository extends JpaRepository<Member,Long> {

    @Query("select m from Member m join fetch m.authentications where m.id = :id")
    Optional<Member> findByEmail(String email);

}
