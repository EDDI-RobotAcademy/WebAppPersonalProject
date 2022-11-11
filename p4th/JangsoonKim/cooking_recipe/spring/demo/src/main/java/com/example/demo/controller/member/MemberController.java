package com.example.demo.controller.member;


import com.example.demo.service.member.MemberService;
import com.example.demo.service.member.request.MemberRegisterRequest;
import com.example.demo.service.member.request.MemberSigninRequest;
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

    @PostMapping("/user-email/{email}")
    public Boolean checkEmailDuplicate(@PathVariable("email") String email){
        log.info("checkEmailDuplicate() " + email);
        log.info("result: " + service.emailValidation(email));

        return service.emailValidation(email);
    }
    @PostMapping("/user-nickname/{nickname}")
    public Boolean checkNicknameDuplicate(@PathVariable("nickname") String nickname){
        log.info("checkNicknameDuplicate() " + nickname);
        log.info("result: " + service.nicknameValidation(nickname));

        return service.nicknameValidation(nickname);
    }
    @PostMapping("/sign-up")
    public Boolean signUp(@RequestBody MemberRegisterRequest request) {
        log.info("signUp: " + request);

        return service.signUp(request);
    }

    @PostMapping("/sign-in")
    public Map<String, String> signIn(@RequestBody MemberSigninRequest request) {
        log.info("signIn: " + request);

        return service.signIn(request);
    }

}
