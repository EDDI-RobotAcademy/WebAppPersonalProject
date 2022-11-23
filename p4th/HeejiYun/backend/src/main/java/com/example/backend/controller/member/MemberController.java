package com.example.backend.controller.member;

import com.example.backend.service.member.MemberService;
import com.example.backend.service.member.request.FlutterUserTokenRequest;
import com.example.backend.service.member.request.MemberModifyRequest;
import com.example.backend.service.member.request.MemberRegisterRequest;
import com.example.backend.service.member.request.MemberSignInRequest;
import com.example.backend.service.member.response.MemberDataResponse;
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
        log.info("result: " + service.emailValidation(email));

        return service.emailValidation(email);
    }

    @PostMapping("/check-nickname/{nickname}")
    public Boolean nicknameValidation(@PathVariable("nickname") String nickname) {
        log.info("nicknameValidation(): " + nickname);
        log.info("result: " + service.nicknameValidation(nickname));

        return service.nicknameValidation(nickname);
    }

    @PostMapping("/sign-up")
    public Boolean signUp(@RequestBody MemberRegisterRequest request) {
        log.info("signUp: " + request);

        return service.signUp(request);
    }

    @PostMapping("/sign-in")
    public String signIn(@RequestBody MemberSignInRequest request) {
        log.info("signIn: " + request);

        return service.signIn(request);
    }

    @PostMapping("/sign-out")
    public Boolean signOut(@RequestBody FlutterUserTokenRequest request) {
        log.info("signOutRequest: " + request);

        return service.signOut(request);
    }

    @PostMapping("/data-read")
    public MemberDataResponse readUserData(@RequestBody FlutterUserTokenRequest request) {
        log.info("readUserData: " + request);

        return service.userData(request);
    }

    @PutMapping("/data-modify")
    public Boolean modifyUserData(@RequestBody MemberModifyRequest request) {
        log.info("modifyUserData: " + request);

        return service.modifyUserData(request);
    }

    @DeleteMapping("/unregister")
    public Boolean removeMember(@RequestBody FlutterUserTokenRequest request) {
        log.info("removeMember: " + request);

        return service.removeMember(request);
    }
}
