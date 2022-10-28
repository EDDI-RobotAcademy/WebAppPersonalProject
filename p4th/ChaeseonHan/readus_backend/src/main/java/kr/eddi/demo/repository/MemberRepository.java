package kr.eddi.demo.repository;

import kr.eddi.demo.entity.ReadUsMember;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<ReadUsMember, Long> {

    @Query("select m from ReadUsMember m join fetch m.authentications where m.email = :email")
    Optional<ReadUsMember> findByEmail(String email);
}
