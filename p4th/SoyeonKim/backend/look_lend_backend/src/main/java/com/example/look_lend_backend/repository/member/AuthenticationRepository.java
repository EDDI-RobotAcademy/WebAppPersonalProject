package com.example.look_lend_backend.repository.member;

import com.example.look_lend_backend.entity.member.Authentication;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthenticationRepository extends JpaRepository<Authentication, Long> {
}
