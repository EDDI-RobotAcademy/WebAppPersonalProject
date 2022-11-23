package com.example.demo.repository.member;

import com.example.demo.entity.member.MemberProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface MemberProfileRepository extends JpaRepository<MemberProfile, Long> {

    @Query("select mp from MemberProfile mp join fetch mp.member where mp.nickname = :nickname")
    Optional<MemberProfile> findByNickname(String nickname);

    @Query("select mp from MemberProfile mp join fetch mp.member where mp.member.email = :email")
    Optional<MemberProfile> findByemail(String email);
}
