package personal_project.look_style.repository.member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import personal_project.look_style.entity.member.Member;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {

    @Query("select m from Member m join fetch m.authentications where m.email = :email")
    Optional<Member> findByEmail(String email);

    @Query("select m from Member m join fetch m.authentications where m.nickname = :nickname")
    Optional<Member> findByNickname(String nickname);
}
