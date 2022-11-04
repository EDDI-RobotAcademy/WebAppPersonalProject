package com.example.plantsweb.service.account;

import com.example.plantsweb.entity.account.Authentication;
import com.example.plantsweb.entity.account.BasicAuthentication;
import com.example.plantsweb.entity.account.Member;
import com.example.plantsweb.repository.account.AuthenticationRepository;
import com.example.plantsweb.repository.account.MemberRepository;
import com.example.plantsweb.service.account.request.MemberLoginRequest;
import com.example.plantsweb.service.account.request.MemberRegisterRequest;
import com.example.plantsweb.service.security.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

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
    public Boolean emailValidation(String email) {
        Optional<Member> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            return false;
        }
        return true;
    }

    @Override
    public Boolean signUp (MemberRegisterRequest request) {
        final Member member = request.toMember();
        memberRepository.save(member);

        final BasicAuthentication auth = new BasicAuthentication(member,
                Authentication.BASIC_AUTH, request.getPassword());

        authenticationRepository.save(auth);

        return true;
    }
}
