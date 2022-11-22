package com.example.demo.repository.member;

import com.example.demo.entity.Authentication.Authentication;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthenticationRepository extends JpaRepository<Authentication, Long> {
}
