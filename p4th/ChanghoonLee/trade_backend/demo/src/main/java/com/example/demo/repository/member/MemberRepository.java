package com.example.demo.repository.member;

import com.example.demo.entity.member.TradeItemMember;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<TradeItemMember, Long> {
    @Query("select m from TradeItemMember m join fetch m.authentications where m.email = :email")
    Optional<TradeItemMember> findByEmail(String email);
}
