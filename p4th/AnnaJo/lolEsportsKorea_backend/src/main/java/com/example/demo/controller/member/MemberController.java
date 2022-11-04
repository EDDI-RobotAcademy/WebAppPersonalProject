package com.example.demo.controller.member;

import com.example.demo.controller.member.request.MemberRegisterForm;
import com.example.demo.service.member.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
     * @return
     */
    @PostMapping("/check-nickname/{nickname}")
    public Boolean nicknameValidation(@PathVariable("nickname") String nickname) {
        log.info("emailValidation(): " + nickname);

        return service.nicknameValidation(nickname);
    }

    /**
     * 회원 가입 Controller
     * @param form
     * @return
     */
    @PostMapping("/sign-up")
    public Boolean signUp(@RequestBody MemberRegisterForm form) {
        log.info("signUp: " + form);

        return service.signUp(form.toMemberRegisterRequest());
    }
}
