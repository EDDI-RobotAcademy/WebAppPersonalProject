package com.example.bucket_list_project.repository.member;

import com.example.bucket_list_project.entity.member.MemberInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<MemberInfo, Long> {
    @Query("select m from MemberInfo m join fetch m.authentications where m.email = :email")
    Optional<MemberInfo> findByEmail(String email);
}
