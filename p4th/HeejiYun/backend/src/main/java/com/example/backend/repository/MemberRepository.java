package com.example.backend.repository;

import com.example.backend.entity.member.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {

    @Query("select m from Member m join fetch m.authentications where m.email = :email")
    Optional<Member> findByEmail(@Param("email")String email);

    @Query("select m from Member m join fetch m.authentications where m.nickname = :nickname")
    Optional<Member> findByNickname(@Param("nickname")String nickname);

}
