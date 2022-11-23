package com.example.bucket_list_project.repository.member;

import com.example.bucket_list_project.entity.member.MemberInfo;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MemberRepository extends JpaRepository<MemberInfo, Long> {
    @Query("select m from MemberInfo m join fetch m.authentications where m.email = :email")
    Optional<MemberInfo> findByEmail(@Param("email") String email);

    @Query("select m from MemberInfo m join fetch m.authentications where m.nickName = :nickName")
    Optional<MemberInfo> findByNickname(@Param("nickName") String nickName);

    @Query("select m from MemberInfo m where m.nickName = :nickName")
    Optional<MemberInfo> findByMemberNickname(@Param("nickName") String nickName);
}
