package kr.eddi.LeaningHelper.repository.Member;
import kr.eddi.LeaningHelper.entity.member.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;


public interface MemberRepository extends JpaRepository<Member,Long> {
    @Query("select m from Member m join fetch m.memberAuths where m.email = :email")
    Optional<Member> findById(String email);

    @Query("select m from Member m join fetch m.memberAuths where m.nickName = :nickName")
    Optional<Member> findByNickName(String nickName);
}
