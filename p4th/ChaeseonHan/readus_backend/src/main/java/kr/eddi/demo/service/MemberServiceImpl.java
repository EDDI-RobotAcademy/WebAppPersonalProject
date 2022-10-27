package kr.eddi.demo.service;


import kr.eddi.demo.entity.ReadUsMember;
import kr.eddi.demo.repository.AuthenticationRepository;
import kr.eddi.demo.repository.MemberRepository;
import kr.eddi.demo.service.request.MemberLoginRequest;
import kr.eddi.demo.service.request.MemberRegisterRequest;
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


    @Override
    public Boolean emailValidation(String email) {
        Optional<ReadUsMember> maybeMember = memberRepository.findByEmail(email);

        return maybeMember.isEmpty();
    }


    @Override
    public Boolean signUp(MemberRegisterRequest request) {
       /* final ReadUsMember member =*/
        return null;
    }


    @Override
    public String signIn(MemberLoginRequest request) {
        return null;
    }


}
