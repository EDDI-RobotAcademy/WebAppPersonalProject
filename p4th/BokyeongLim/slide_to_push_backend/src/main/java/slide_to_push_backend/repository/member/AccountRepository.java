package slide_to_push_backend.repository.member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import slide_to_push_backend.entity.member.Account;

import java.util.Optional;

public interface AccountRepository extends JpaRepository<Account, Long> {

    @Query("select m from Account m join fetch m.authentications where m.email = :email")
    Optional<Account> findByEmail(String email);

}
