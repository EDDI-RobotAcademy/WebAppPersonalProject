package kr.eddi.demo.service;


import kr.eddi.demo.entity.Authentication;
import kr.eddi.demo.entity.BasicAuthentication;
import kr.eddi.demo.entity.ReadUsMember;
import kr.eddi.demo.repository.AuthenticationRepository;
import kr.eddi.demo.repository.MemberRepository;
import kr.eddi.demo.service.request.MemberLoginRequest;
import kr.eddi.demo.service.request.MemberRegisterRequest;
import kr.eddi.demo.service.security.RedisServiceImpl;
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
    private RedisServiceImpl redisService;


    @Override
    public Boolean emailValidation(String email) {
        Optional<ReadUsMember> maybeMember = memberRepository.findByEmail(email);

        return maybeMember.isEmpty();
    }


    @Override
    public Boolean signUp(MemberRegisterRequest request) {
        final ReadUsMember member = request.toMember();
        memberRepository.save(member);

        final BasicAuthentication auth = new BasicAuthentication(member, Authentication.BASIC_AUTH, request.getPassword());

        authenticationRepository.save(auth);

        return true;
    }


    @Override
    public String signIn(MemberLoginRequest request) {
        String email = request.getEmail();
        Optional<ReadUsMember> maybeMember = memberRepository.findByEmail(email);

        if(maybeMember.isPresent()) {
            ReadUsMember member = maybeMember.get();

            if(!member.isRightPassword(request.getPassword())) {
                throw new RuntimeException("패스워드가 잘못되었습니다! 다시 한 번 확인해주세요.");
            }

            UUID userToken = UUID.randomUUID();

            redisService.deleteByKey(userToken.toString());
            redisService.setKeyAndValue(userToken.toString(), member.getId());

            return userToken.toString();

        }
        throw new RuntimeException("가입된 사용자가 아닙니다.");
    }

    @Override
    public ReadUsMember getSignInMemberProfile(String signInUserToken) {

        String userToken = signInUserToken;
        Long memberId = redisService.getValueByKey(userToken);

        Optional<ReadUsMember> maybeMember = memberRepository.findById(memberId);
        ReadUsMember member = maybeMember.get();
        return member;

    }


}
