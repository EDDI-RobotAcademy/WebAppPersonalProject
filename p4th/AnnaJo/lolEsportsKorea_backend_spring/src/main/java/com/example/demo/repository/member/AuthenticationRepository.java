package com.example.demo.repository.member;

import com.example.demo.entity.Authentication.Authentication;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface AuthenticationRepository extends JpaRepository<Authentication, Long> {
    @Query("select a from Authentication a where a.member.id = :member_id")
    Optional<Authentication> findByMemberId(Long member_id);
}
