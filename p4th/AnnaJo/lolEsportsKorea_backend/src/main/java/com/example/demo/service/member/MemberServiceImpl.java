package com.example.demo.service.member;

import com.example.demo.entity.Authentication.Authentication;
import com.example.demo.entity.Authentication.BasicAuthentication;
import com.example.demo.entity.member.Member;
import com.example.demo.entity.member.MemberProfile;
import com.example.demo.repository.member.AuthenticationRepository;
import com.example.demo.repository.member.MemberProfileRepository;
import com.example.demo.repository.member.MemberRepository;
import com.example.demo.service.member.request.MemberLoginRequest;
import com.example.demo.service.member.request.MemberRegisterRequest;
import com.example.demo.service.security.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private RedisService redisService;

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

    @Override
    public String signIn(MemberLoginRequest request) {
        String email = request.getEmail();
        Optional<Member> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            Member member = maybeMember.get();

            log.info("member email:" + member.getEmail());
            log.info("request email:" + request.getEmail());
            log.info("request password:" + request.getPassword());

            if (!member.isRightPassword(request.getPassword())) {
                throw new RuntimeException("패스워드가 잘 못되었습니다.");
            }

            UUID userToken = UUID.randomUUID();

            redisService.deleteByKey(userToken.toString());
            redisService.setKeyAndValue(userToken.toString(), member.getId());

            return userToken.toString();
        }

        throw new RuntimeException("가입된 정보가 없습니다.");
    }
}
