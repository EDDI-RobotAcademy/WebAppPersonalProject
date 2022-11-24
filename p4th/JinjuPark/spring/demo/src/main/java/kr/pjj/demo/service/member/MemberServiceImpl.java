package kr.pjj.demo.service.member;


import kr.pjj.demo.entity.member.Authentication;
import kr.pjj.demo.entity.member.BasicAuthentication;
import kr.pjj.demo.entity.member.Member;
import kr.pjj.demo.repository.member.AuthenticationRepository;
import kr.pjj.demo.repository.member.MemberRepository;
import kr.pjj.demo.service.member.request.MemberLoginRequest;
import kr.pjj.demo.service.member.request.MemberRegisterRequest;
import kr.pjj.demo.service.security.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
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
    public Boolean nickNameValidation(String nickname) {
        Optional<Member> maybeMember = memberRepository.findByNickname(nickname);

        if (maybeMember.isPresent()) {
            return false;
        }

        return true;
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

            log.info("member email: " + member.getEmail());
            log.info("request email: " + request.getEmail());
            log.info("request password: " + request.getPassword());

            if (!member.isRightPassword(request.getPassword())) {
                // 패스워드가 잘못 된 경우
                throw new RuntimeException("아이디 또는 패스워드가 잘못되었습니다");
            }

            UUID userToken = UUID.randomUUID();

            redisService.deleteByKey(userToken.toString());
            redisService.setKeyAndValue(userToken.toString(), member.getId());

            log.info("유저토큰: "+userToken.toString());
            log.info("레디스 유저토큰으로 멤버아이디 구하기: "+ redisService.getValueByKey(userToken.toString()));
            log.info("유저토큰:"+userToken.toString() +" 멤버아이디:"+ member.getId());

            return userToken.toString();
        }

        // 이메일이 가입되어 있지 않은 경우
        throw new RuntimeException("아이디 또는 패스워드가 잘못되었습니다");
    }
    @Override
    public List<Member> loginUserInfo(String loginUserToken){
        String userToken = loginUserToken.substring(3,39);

        log.info("로그인 유저토큰 : " + loginUserToken);
        log.info("로그인 유저토큰 추출 : " + userToken);

        Long loginUserId = redisService.getValueByKey(userToken);
        log.info("로그인 유저아이디 번호: " + redisService.getValueByKey(userToken));

        Optional<Member> maybeMember = memberRepository.findById(loginUserId);
        List<Member> member = new ArrayList<>();
        member.add(maybeMember.get());

        log.info("로그인 멤버 정보: "+ member.toString() );
        return member;
    }

    @Override
    public String modifyNickName(Long memberId, String reNickName) {

        String msg = "";
        if(nickNameValidation(reNickName)){
            Optional<Member> maybeMember= memberRepository.findById(memberId);
            if(maybeMember.isEmpty()){
                msg="회원 정보를 찾을 수 없습니다";
                return msg;
            }
            Member member = maybeMember.get();
            member.setNickname(reNickName);

            memberRepository.save(member);
            msg ="닉네임이 변경되었습니다.";
        } else{
            msg ="중복된 닉네임입니다.";
        }
        return msg;
    }
}
