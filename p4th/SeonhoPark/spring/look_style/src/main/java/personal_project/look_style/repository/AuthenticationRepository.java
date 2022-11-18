package personal_project.look_style.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import personal_project.look_style.entity.Authentication;

public interface AuthenticationRepository extends JpaRepository<Authentication, Long> {
}
