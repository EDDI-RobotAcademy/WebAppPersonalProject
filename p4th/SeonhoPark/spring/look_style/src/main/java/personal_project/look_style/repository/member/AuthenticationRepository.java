package personal_project.look_style.repository.member;

import org.springframework.data.jpa.repository.JpaRepository;
import personal_project.look_style.entity.member.Authentication;

public interface AuthenticationRepository extends JpaRepository<Authentication, Long> {
}
