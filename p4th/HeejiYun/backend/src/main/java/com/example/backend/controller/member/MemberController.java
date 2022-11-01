package com.example.backend.controller.member;

import com.example.backend.service.member.MemberService;
import com.example.backend.service.member.request.MemberRegisterRequest;
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

    @PostMapping("/check-email/{email}")
    public Boolean emailValidation(@PathVariable("email") String email) {
        log.info("emailValidation(): " + email);

        return service.emailValidation(email);
    }

    @PostMapping("/check-nickname/{nickname}")
    public Boolean nicknameValidation(@PathVariable("nickname") String nickname) {
        log.info("nicknameValidation(): " + nickname);

        return service.nicknameValidation(nickname);
    }

    @PostMapping("/sign-up")
    public Boolean signUp(@RequestBody MemberRegisterRequest request) {
        log.info("signUp: " + request);

        return service.signUp(request);
    }
}
