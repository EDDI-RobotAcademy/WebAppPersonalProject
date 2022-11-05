package com.example.plantsweb.repository.account;

import com.example.plantsweb.entity.account.Authentication;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthenticationRepository extends JpaRepository<Authentication, Long> {
}
