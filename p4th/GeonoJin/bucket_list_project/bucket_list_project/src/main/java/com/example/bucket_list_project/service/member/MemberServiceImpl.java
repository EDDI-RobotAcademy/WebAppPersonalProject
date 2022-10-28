package com.example.bucket_list_project.service.member;

import com.example.bucket_list_project.entity.member.Authentication;
import com.example.bucket_list_project.entity.member.BasicAuthentication;
import com.example.bucket_list_project.entity.member.MemberInfo;
import com.example.bucket_list_project.repository.member.AuthenticationRepository;
import com.example.bucket_list_project.repository.member.MemberRepository;
import com.example.bucket_list_project.service.member.request.MemberSignUpRequest;
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
    private AuthenticationRepository authenticationRepository;

    @Override
    public Boolean emailValidation(String email) {
        Optional<MemberInfo> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            return false;
        }

        return true;
    }

    @Override
    public Boolean signUp(MemberSignUpRequest signUpRequest) {
        final MemberInfo member = signUpRequest.memberInfo();
        memberRepository.save(member);

        final BasicAuthentication auth = new BasicAuthentication(member,
                Authentication.BASIC_AUTH, signUpRequest.getPassword());

        authenticationRepository.save(auth);

        return true;
    }
}
