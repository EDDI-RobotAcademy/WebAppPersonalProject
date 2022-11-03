package com.example.look_lend_backend.service.member;

import com.example.look_lend_backend.entity.member.Authentication;
import com.example.look_lend_backend.entity.member.BasicAuthentication;
import com.example.look_lend_backend.entity.member.Member;
import com.example.look_lend_backend.repository.member.AuthenticationRepository;
import com.example.look_lend_backend.repository.member.MemberRepository;
import com.example.look_lend_backend.service.member.request.MemberRegisterRequest;
import com.example.look_lend_backend.service.security.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService{

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private AuthenticationRepository authenticationRepository;

    @Autowired
    private RedisService redisService;


    @Override
    public Boolean signUp(MemberRegisterRequest request) {
        final Member member = request.toMember();
        memberRepository.save(member);

        final BasicAuthentication auth = new BasicAuthentication(member,
                Authentication.BASIC_AUTH, request.getPassword());

        authenticationRepository.save(auth);

        return true;
    }

    @Override
    public Boolean emailValidation(String email) {
        Optional<Member> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            return false;
        }
        return true;
    }
}
