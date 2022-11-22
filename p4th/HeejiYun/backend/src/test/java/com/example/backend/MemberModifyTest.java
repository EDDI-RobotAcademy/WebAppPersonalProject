package com.example.backend;

import com.example.backend.entity.board.Board;
import com.example.backend.entity.member.Authentication;
import com.example.backend.entity.member.Member;
import com.example.backend.repository.AuthenticationRepository;
import com.example.backend.repository.BoardRepository;
import com.example.backend.repository.MemberRepository;
import com.example.backend.service.member.request.MemberModifyRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Sort;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@SpringBootTest
public class MemberModifyTest {
    @Autowired
    private MemberRepository memberRepository;

    @Test
    void memberModifyTest () {
        Long memberId = Long.valueOf(5);
        String modifyNickname = "광수";
        Optional<Member> maybeMember = memberRepository.findById(memberId);
        if (maybeMember.isPresent()) {
            Member member = maybeMember.get();
            member.setNickname(modifyNickname);
            memberRepository.save(member);
        }
    }
}
