package kr.eddi.LeaningHelper.service.member;

import kr.eddi.LeaningHelper.entity.member.Member;
import kr.eddi.LeaningHelper.entity.member.MemberAuth;
import kr.eddi.LeaningHelper.entity.member.MemberBasicAuth;
import kr.eddi.LeaningHelper.entity.member.MemberProfile;
import kr.eddi.LeaningHelper.repository.Member.MemberAuthRepository;
import kr.eddi.LeaningHelper.repository.Member.MemberProfileRepository;
import kr.eddi.LeaningHelper.repository.Member.MemberRepository;
import kr.eddi.LeaningHelper.request.member.MemberSignUpRequest;
import kr.eddi.LeaningHelper.request.member.MemberSignInRequest;
import kr.eddi.LeaningHelper.service.security.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService{

    static final Integer PASSVALIDATE = 0;
    static final Integer FAILALIDATE = 1;

    @Autowired
    MemberRepository memberRepository;

    @Autowired
    private RedisService redisService;
    @Autowired
    MemberProfileRepository memberProfileRepository;

    @Autowired
    MemberAuthRepository memberAuthRepository;

    @Override
    public Boolean memberSignUp(MemberSignUpRequest memberSignUpRequest) {
        final Member member = memberSignUpRequest.toMember();
        memberRepository.save(member);

        MemberProfile memberProfile = MemberProfile.builder()
                .member(member)
                .build();

        memberProfileRepository.save(memberProfile);


        final MemberBasicAuth auth = new MemberBasicAuth(member,
                MemberAuth.BASIC_AUTH, memberSignUpRequest.getPassword());

        memberAuthRepository.save(auth);

        return true;
    }

    @Override
    public Integer emailValidation(String email) {
        Optional<Member> maybeMember = memberRepository.findById(email);

        if (maybeMember.isPresent()) {
            log.info("maybeMember.isPresent() : " + maybeMember.isPresent());
            return FAILALIDATE;
        }
        return PASSVALIDATE;
    }

    @Override
    public Integer nickNameValidation(String nickName) {
        Optional<Member> maybeMemberNickName = memberRepository.findByNickName(nickName);

        if (maybeMemberNickName.isPresent()) {
            log.info("maybeMemberNickName.isPresent() : " + maybeMemberNickName.isPresent());
            return FAILALIDATE;
        }

        return PASSVALIDATE;
    }

    @Override
    public Map<String, String> signIn(MemberSignInRequest memberSignInRequest) {
        String email = memberSignInRequest.getEmail();
        Optional<Member> maybeMember = memberRepository.findById(email);

        if(maybeMember.isPresent()) {
            Member member = maybeMember.get();

            String admin = "admin@admin.com";
            String isAdmin = "isNotAdmin";
            int checkAdmin = admin.compareTo(member.getEmail());
            if (checkAdmin == 0) {
                isAdmin = "isAdmin";
            }
            log.info("isAdmin: " + isAdmin);
            log.info("member ID: " + member.getEmail());
            log.info("request ID: " + memberSignInRequest.getEmail());
            log.info("request PW: " + memberSignInRequest.getPassword());

            if (!member.isRightPassword(memberSignInRequest.getPassword())) {
                throw new RuntimeException("패스워드가 잘못됨!");
            }
            UUID userToken = UUID.randomUUID();

            redisService.deleteByKey(userToken.toString());
            redisService.setKeyAndValue(userToken.toString(), member.getMemberNo());
            Map<String, String> userData = new HashMap<>();
            userData.put("userToken", userToken.toString());
            userData.put("Email", member.getEmail());
            userData.put("Nickname", member.getNickName());
            userData.put("Admin", isAdmin);
            return userData;
        }

        throw new RuntimeException("가입된 사용자가 아님!");
    }
}
