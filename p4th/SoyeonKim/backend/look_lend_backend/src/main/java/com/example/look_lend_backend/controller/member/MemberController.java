package com.example.look_lend_backend.controller.member;

import com.example.look_lend_backend.controller.member.form.MemberLoginForm;
import com.example.look_lend_backend.controller.member.form.MemberRegisterForm;
import com.example.look_lend_backend.service.member.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/member")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")

public class MemberController {

    @Autowired
    private MemberService service;

    @PostMapping("/sign-up")
    public Boolean signUp(@RequestBody MemberRegisterForm form) {
        log.info("signUp: " + form);

        return service.signUp(form.toMemberRegisterRequest());
    }

    @PostMapping("/check-email/{email}")
    public Boolean emailValidation(@PathVariable("email") String email) {
        log.info("emailValidation(): " + email);

        return service.emailValidation(email);
    }

    @PostMapping("/check-nickname/{nickname}")
    public Boolean nicknameValidation(@PathVariable("nickname") String nickname) {
        log.info("nicknameValidation(): " + nickname);

        return service.nickNameValidation(nickname);
    }

    @PostMapping("/sign-in")
    public String signIn(@RequestBody MemberLoginForm form) {
        log.info("signIn:" + form);

        return service.signIn(form.toLoginRequest());
    }


}
