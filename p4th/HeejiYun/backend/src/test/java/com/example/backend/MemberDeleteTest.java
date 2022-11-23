package com.example.backend;

import com.example.backend.entity.board.Board;
import com.example.backend.entity.member.Authentication;
import com.example.backend.repository.AuthenticationRepository;
import com.example.backend.repository.BoardRepository;
import com.example.backend.repository.MemberRepository;
import com.example.backend.service.member.MemberService;
import com.example.backend.service.member.request.MemberRegisterRequest;
import com.example.backend.service.security.RedisService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Sort;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@SpringBootTest
public class MemberDeleteTest {
    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private AuthenticationRepository authenticationRepository;

    @Autowired
    private BoardRepository boardRepository;


    @Test
    void memberDeleteTest () {
        Long memberId = Long.valueOf(1);

        final Optional<Authentication> maybeAuth = authenticationRepository.findByMemberId(memberId);
        if (maybeAuth.isPresent()) {
            maybeAuth.get().getId();
            authenticationRepository.deleteById(maybeAuth.get().getId());
        }

        List<Board> boards = new ArrayList<>();
        boards = boardRepository.findAllBoardsByMemberId(memberId, Sort.by(Sort.Direction.DESC, "boardNo"));

        for(Board b: boards) {
            boardRepository.deleteById(b.getBoardNo());
        }
        memberRepository.deleteById(memberId);
    }
}
