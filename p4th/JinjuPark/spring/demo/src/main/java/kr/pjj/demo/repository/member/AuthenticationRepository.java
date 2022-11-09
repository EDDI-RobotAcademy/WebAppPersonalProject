package kr.pjj.demo.repository.member;


import kr.pjj.demo.entity.member.Authentication;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthenticationRepository extends JpaRepository<Authentication, Long> {
}
