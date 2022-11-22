package com.example.backend.repository;

import com.example.backend.entity.member.Authentication;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface AuthenticationRepository extends JpaRepository<Authentication, Long> {
    @Query("select a from Authentication a where a.member.Id = :member_id")
    Optional<Authentication> findByMemberId(Long member_id);

}
