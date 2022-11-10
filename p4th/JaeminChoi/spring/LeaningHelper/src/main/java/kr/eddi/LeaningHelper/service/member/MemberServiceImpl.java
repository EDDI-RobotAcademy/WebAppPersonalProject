package kr.eddi.LeaningHelper.service.member;

import kr.eddi.LeaningHelper.entity.member.Member;
import kr.eddi.LeaningHelper.entity.member.MemberAuth;
import kr.eddi.LeaningHelper.entity.member.MemberBasicAuth;
import kr.eddi.LeaningHelper.entity.member.MemberProfile;
import kr.eddi.LeaningHelper.repository.Member.MemberAuthRepository;
import kr.eddi.LeaningHelper.repository.Member.MemberProfileRepository;
import kr.eddi.LeaningHelper.repository.Member.MemberRepository;
import kr.eddi.LeaningHelper.request.member.MemberRegisterRequest;
import kr.eddi.LeaningHelper.request.member.MemberSignInRequest;
import kr.eddi.LeaningHelper.service.security.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService{

    @Autowired
    MemberRepository memberRepository;

    @Autowired
    private RedisService redisService;
    @Autowired
    MemberProfileRepository memberProfileRepository;

    @Autowired
    MemberAuthRepository memberAuthRepository;

    @Override
    public Boolean memberRegister(MemberRegisterRequest memberRegisterRequest) {
        final Member member = memberRegisterRequest.toMember();
        memberRepository.save(member);

        MemberProfile memberProfile = MemberProfile.builder()
                .member(member)
                .build();

        memberProfileRepository.save(memberProfile);


        final MemberBasicAuth auth = new MemberBasicAuth(member,
                MemberAuth.BASIC_AUTH, memberRegisterRequest.getPw());

        memberAuthRepository.save(auth);

        return true;
    }

    @Override
    public Boolean emailValidation(String email) {
        Optional<Member> maybeMember = memberRepository.findById(email);

        if (maybeMember.isPresent()) {
            return false;
        }

        return true;
    }

    @Override
    public Boolean nickNameValidation(String nickName) {
        Optional<Member> maybeMemberNickName = memberRepository.findByNickName(nickName);

        if (maybeMemberNickName.isPresent()) {
            return false;
        }

        return true;
    }

    @Override
    public String signIn(MemberSignInRequest memberSignInRequest) {
        String id = memberSignInRequest.getId();
        Optional<Member> maybeMember = memberRepository.findById(id);

        if(maybeMember.isPresent()){
            Member member = maybeMember.get();

            log.info("member ID: " + member.getId());
            log.info("request ID: " + memberSignInRequest.getId());
            log.info("request PW: " + memberSignInRequest.getPw());

            if (!member.isRightPassword(memberSignInRequest.getPw())) {
                throw new RuntimeException("패스워드가 잘못됨!");
            }
            UUID userToken = UUID.randomUUID();

            redisService.deleteByKey(userToken.toString());
            redisService.setKeyAndValue(userToken.toString(), member.getMemberNo());

            return userToken.toString();
        }

        throw new RuntimeException("가입된 사용자가 아님!");
    }
}
