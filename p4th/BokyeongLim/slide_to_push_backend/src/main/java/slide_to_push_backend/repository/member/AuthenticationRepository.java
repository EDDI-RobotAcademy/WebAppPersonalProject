package slide_to_push_backend.repository.member;

import org.springframework.data.jpa.repository.JpaRepository;
import slide_to_push_backend.entity.member.Authentication;

public interface AuthenticationRepository extends JpaRepository<Authentication, Long> {
}
