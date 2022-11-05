package com.example.bucket_list_project.service.member;

import com.example.bucket_list_project.entity.member.Authentication;
import com.example.bucket_list_project.entity.member.BasicAuthentication;
import com.example.bucket_list_project.entity.member.MemberInfo;
import com.example.bucket_list_project.repository.member.AuthenticationRepository;
import com.example.bucket_list_project.repository.member.MemberRepository;
import com.example.bucket_list_project.service.member.request.MemberSignInRequest;
import com.example.bucket_list_project.service.member.request.MemberSignUpRequest;
import com.example.bucket_list_project.service.member.security.RedisService;
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
    private AuthenticationRepository authenticationRepository;

    @Autowired
    private RedisService redisService;

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
        final MemberInfo member = signUpRequest.toMemberInfo();
        memberRepository.save(member);

        final BasicAuthentication auth = new BasicAuthentication(member,
                Authentication.BASIC_AUTH, signUpRequest.getPassword());

        authenticationRepository.save(auth);

        return true;
    }

    @Override
    public String signIn(MemberSignInRequest signInRequest) {
        String email = signInRequest.getEmail();
        Optional<MemberInfo> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            MemberInfo memberInfo = maybeMember.get();

            if (!memberInfo.isRightPassword(signInRequest.getPassword())) {
                throw new RuntimeException("잘못된 패스워드");
            }

            UUID userToken = UUID.randomUUID();

            redisService.deleteByKey(userToken.toString());
            redisService.setKeyAndValue(userToken.toString(), memberInfo.getId());

            return userToken.toString();
        }

        throw new RuntimeException("회원가입이 되어있지 않는 회원");
    }

    @Override
    public Boolean nicknameDoubleCheck(String nickName) {
        Optional<MemberInfo> maybeMemberNickname = memberRepository.findByNickname(nickName);

        if (maybeMemberNickname.isPresent()) {
            return false;
        }

        return true;
    }

    @Override
    public String findCurrentUserNickName(String currentUserValue) {
        Long currentUserId = redisService.getValueByKey(currentUserValue);

        Optional<MemberInfo> maybeMemberId = memberRepository.findById(currentUserId);

        if (maybeMemberId.isPresent()) {
            MemberInfo memberNickname = maybeMemberId.get();
            return memberNickname.getNickName();
        }

        return null;
    }
}
