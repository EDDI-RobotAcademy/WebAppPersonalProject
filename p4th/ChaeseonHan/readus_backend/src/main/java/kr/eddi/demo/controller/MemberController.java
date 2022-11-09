package kr.eddi.demo.controller;


import kr.eddi.demo.controller.form.MemberLoginForm;
import kr.eddi.demo.controller.form.MemberRegisterForm;
import kr.eddi.demo.entity.MemberProfile;
import kr.eddi.demo.service.MemberServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Slf4j
@RestController
@RequestMapping("/member")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class MemberController {


    @Autowired
    MemberServiceImpl service;

    @PostMapping ("/check-email/{email}")
    public Boolean emailValidation(@PathVariable("email") String email) {
        log.info("checkEmail()");

        return service.emailValidation(email);
    }

    @PostMapping("/register")
    public Boolean signUp(@RequestBody MemberRegisterForm form){
        log.info("signup: " + form);

        return service.signUp(form.toMemberRegisterRequest());
    }

    @PostMapping("/login")
    public String signIn(@RequestBody MemberLoginForm form) {
        log.info("signin:" + form);

        return service.signIn(form.toMemberLoginRequest());
    }

    @PostMapping("/login-user-nickname/{userToken}")
    public String loginUserProfile(@PathVariable("userToken") String userToken) {
        log.info("nowMemberProfile()");

        String userNickname = service.getSignInMemberNickName(userToken);

        return userNickname;
    }
}
