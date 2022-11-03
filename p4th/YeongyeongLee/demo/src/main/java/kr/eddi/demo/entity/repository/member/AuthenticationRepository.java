package kr.eddi.demo.entity.repository.member;

import kr.eddi.demo.entity.jpa.member.Authentication;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthenticationRepository extends JpaRepository<Authentication, Long> {}
