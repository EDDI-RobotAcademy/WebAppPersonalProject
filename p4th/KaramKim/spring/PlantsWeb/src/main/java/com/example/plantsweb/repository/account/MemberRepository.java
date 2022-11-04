package com.example.plantsweb.repository.account;

import com.example.plantsweb.entity.account.Member;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Long> {

}
