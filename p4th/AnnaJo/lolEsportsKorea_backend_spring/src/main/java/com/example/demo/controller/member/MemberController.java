package com.example.demo.controller.member;

import com.example.demo.controller.member.request.MemberLoginForm;
import com.example.demo.controller.member.request.MemberRegisterForm;
import com.example.demo.service.member.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/member")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class MemberController {

    @Autowired
    private MemberService service;

    /**
     * 이메일 중복 검사 Controller 메서드
     * @param email 이메일
     * @return true or false
     */
    @PostMapping("/check-email/{email}")
    public Boolean emailValidation(@PathVariable("email") String email) {
        log.info("emailValidation(): " + email);

        return service.emailValidation(email);
    }

    /**
     * 닉네임 중복 검사 Controller 메서드
     * @param nickname
     * @return true or false
     */
    @PostMapping("/check-nickname/{nickname}")
    public Boolean nicknameValidation(@PathVariable("nickname") String nickname) {
        log.info("emailValidation(): " + nickname);

        return service.nicknameValidation(nickname);
    }

    /**
     * 회원 가입 Controller 메서드
     * @param form
     * @return true or false
     */
    @PostMapping("/sign-up")
    public Boolean signUp(@RequestBody MemberRegisterForm form) {
        log.info("signUp: " + form);

        return service.signUp(form.toMemberRegisterRequest());
    }

    /**
     * 회원 로그인 Controller 메서드
     *
     * @param form
     * @return String
     */
    @PostMapping("/sign-in")
    public Map<String, String> signIn(@RequestBody MemberLoginForm form) {
        log.info("signIn: " + form);

        return service.signIn(form.toLoginRequest());
    }
}
