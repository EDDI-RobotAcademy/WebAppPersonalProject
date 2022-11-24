package personal_project.look_style.service.member;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import personal_project.look_style.entity.member.Authentication;
import personal_project.look_style.entity.member.BasicAuthentication;
import personal_project.look_style.entity.member.Member;
import personal_project.look_style.repository.member.AuthenticationRepository;
import personal_project.look_style.repository.member.MemberRepository;
import personal_project.look_style.service.member.request.MemberSignInRequest;
import personal_project.look_style.service.member.request.MemberSignUpRequest;
import personal_project.look_style.service.security.RedisService;

import java.util.*;

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
        Optional<Member> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            return false;
        }

        return true;
    }

    @Override
    public Boolean nicknameValidation(String nickname) {
        Optional<Member> maybeMember = memberRepository.findByNickname(nickname);

        if (maybeMember.isPresent()) {
            return false;
        }

        return true;
    }

    @Override
    public Boolean signUp(MemberSignUpRequest request) {
        final Member member = request.toMember();
        memberRepository.save(member);

        final BasicAuthentication auth = new BasicAuthentication(member,
                Authentication.BASIC_AUTH, request.getPassword());

        authenticationRepository.save(auth);

        return true;
    }

    @Override
    public String signIn(MemberSignInRequest request) {
        String email = request.getEmail();
        Optional<Member> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            Member member = maybeMember.get();

            log.info("멤버: " + maybeMember.get());

            log.info("member email: " + member.getEmail());
            log.info("request email: " + request.getEmail());
            log.info("request password: " + request.getPassword());

            if (!member.isRightPassword(request.getPassword())) {
                throw new RuntimeException("패스워드가 잘못됨!");
            }

            UUID userToken = UUID.randomUUID();

            redisService.deleteByKey(userToken.toString());
            redisService.setKeyAndValue(userToken.toString(), member.getId());

            return userToken.toString();
        }

        throw new RuntimeException("가입된 사용자가 아님!");
    }

    @Override
    public Map<String, String> sendUserInfo(MemberSignInRequest request) {
        Map<String, String> userInfo = new HashMap<>();
        String email = request.getEmail();
        Optional<Member> maybeMember = memberRepository.findByEmail(email);

        if (maybeMember.isPresent()) {
            Member member = maybeMember.get();

            if (!member.isRightPassword(request.getPassword())) {
                throw new RuntimeException("비밀번호가 틀렸습니다.");
            }

            UUID userToken = UUID.randomUUID();

            redisService.deleteByKey(userToken.toString());
            redisService.setKeyAndValue(userToken.toString(), member.getId());

            userInfo.put("token", userToken.toString());
            userInfo.put("email", member.getEmail());
            userInfo.put("nickname", member.getNickname());

            return userInfo;
        }

        throw new RuntimeException("가입된 사용자가 아닙니다.");
    }
}
