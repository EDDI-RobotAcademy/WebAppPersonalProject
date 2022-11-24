package kr.pjj.demo;

import kr.pjj.demo.entity.member.Member;
import kr.pjj.demo.repository.member.MemberRepository;
import kr.pjj.demo.service.member.MemberService;
import kr.pjj.demo.service.member.request.MemberLoginRequest;
import kr.pjj.demo.service.member.request.MemberRegisterRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

@SpringBootTest
public class MemberTestCase {

    @Autowired
    private MemberService service;

    @Autowired
    private MemberRepository repository;

    //MemberServiceImpl의 메소드와 받아야하는 파라미터만 입력해주면 테스트 가능

    @Test
    void memberSignUpTest() {
        MemberRegisterRequest registerRequest = new MemberRegisterRequest("he@he.com", "hehe", "김헤헤", "웃는헤헤씨","서울시", "마포구", "102", "12305");
        service.signUp(registerRequest);
    }

    @Test
    void memberSignInTest() {
        MemberLoginRequest loginRequest = new MemberLoginRequest("he@he.com", "hehe");
        service.signIn(loginRequest);
    }

    @Test
    void emailValidationTest(){
        boolean emailCheck = service.emailValidation("hehe@he.com");
        System.out.println("이메일 중복 체크: " + emailCheck);
    }

    @Test
    void nicknameValidationTest(){
        boolean nicknameCheck = service.nickNameValidation("웃는헤헤씨");
        System.out.println("닉네임 중복 체크: " + nicknameCheck);
    }

    @Test
    void modifyNickName(){
        String reNickName= "닉네임변경";
        Long memberId= 1L;
        if(service.nickNameValidation(reNickName)){
            Optional<Member> maybeMember= repository.findById(memberId);
            if(maybeMember.isEmpty()){
                System.out.println("회원 정보를 찾을 수 없습니다");

            }
            Member member = maybeMember.get();
            member.setNickname(reNickName);

            repository.save(member);
           System.out.println("닉네임 변경 됨: " + member.getNickname());
        } else{
            System.out.println("중복된 닉네임입니다.");
        }
    }
}





