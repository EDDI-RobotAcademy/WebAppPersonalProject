package slide_to_push_backend.repository.member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import slide_to_push_backend.entity.member.Account;

import java.util.Optional;

public interface AccountRepository extends JpaRepository<Account, Long> {

    @Query("select m from Account m join fetch m.authentications where m.email = :email")
    Optional<Account> findByEmail(String email);

    @Query("select a from Account a join fetch a.authentications where a.id = :id")
    Optional<Account> findByAccount(Long id);
    // 계속  beans.factory.UnsatisfiedDependencyException 오류 난 이유 위의 id인데 인수값을 memNo로 넣어서...
}
