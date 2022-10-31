package com.example.bucket_list_project.repository.member;

import com.example.bucket_list_project.entity.member.Authentication;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthenticationRepository extends JpaRepository<Authentication, Long> {
}
