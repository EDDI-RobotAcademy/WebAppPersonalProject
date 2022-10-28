package com.example.bucket_list_project.service.member;

import com.example.bucket_list_project.entity.member.MemberInfo;
import com.example.bucket_list_project.repository.member.MemberRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberRepository memberRepository;

    @Override
    public Boolean emailValidation(String email) {
        Optional<MemberInfo> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            return false;
        }

        return true;
    }
}
