package personal_project.look_style.service.member;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import personal_project.look_style.entity.Authentication;
import personal_project.look_style.entity.BasicAuthentication;
import personal_project.look_style.entity.Member;
import personal_project.look_style.repository.AuthenticationRepository;
import personal_project.look_style.repository.MemberRepository;
import personal_project.look_style.service.member.request.MemberSignInRequest;
import personal_project.look_style.service.member.request.MemberSignUpRequest;
import personal_project.look_style.service.security.RedisService;

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
}
