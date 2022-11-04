package com.example.demo.service.member;

import com.example.demo.entity.Authentication.Authentication;
import com.example.demo.entity.Authentication.BasicAuthentication;
import com.example.demo.entity.member.Member;
import com.example.demo.entity.member.MemberProfile;
import com.example.demo.repository.member.AuthenticationRepository;
import com.example.demo.repository.member.MemberProfileRepository;
import com.example.demo.repository.member.MemberRepository;
import com.example.demo.service.member.request.MemberRegisterRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private MemberProfileRepository memberProfileRepository;

    @Autowired
    private AuthenticationRepository authenticationRepository;


    @Override
    public Boolean emailValidation(String email) {
        Optional<Member> maybeMember = memberRepository.findByEmail(email);

        return maybeMember.isEmpty();
    }

    @Override
    public Boolean nicknameValidation(String nickname) {
        Optional<MemberProfile> maybeMember = memberProfileRepository.findByNickname(nickname);

        return maybeMember.isEmpty();
    }

    @Override
    public Boolean signUp(MemberRegisterRequest request) {
        final Member member = request.toMember();
        memberRepository.save(member);

        final BasicAuthentication auth = new BasicAuthentication(member,
                Authentication.BASIC_AUTH, request.getPassword());

        authenticationRepository.save(auth);

        return true;
    }
}
