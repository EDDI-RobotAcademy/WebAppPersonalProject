package com.example.bucket_list_project.controller.member;

import com.example.bucket_list_project.controller.member.form.MemberSignInForm;
import com.example.bucket_list_project.controller.member.form.MemberSignUpForm;
import com.example.bucket_list_project.service.member.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/member")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @PostMapping("/check-email/{email}")
    public Boolean emailValidation(@PathVariable("email") String email) {
        log.info("emailValidation(): " + email);
        log.info("이메일 전달하는 값" + memberService.emailValidation(email));

        return memberService.emailValidation(email);
    }

    @PostMapping("/sign-up")
    public Boolean signUp(@RequestBody MemberSignUpForm signUpForm) {
        log.info("signUp: " + signUpForm);

        return memberService.signUp(signUpForm.toMemberSignUpRequest());
    }

    @PostMapping("/sign-in")
    public String SignIn(@RequestBody MemberSignInForm signInForm) {
        log.info("SignIn: " + signInForm);

        return memberService.signIn(signInForm.toMemberSignInRequest());
    }

    @PostMapping ("/check-nickname/{nickName}")
    public Boolean NicknameDoubleCheck(@PathVariable("nickName") String nickName) {
        log.info("NicknameDoubleCheck: " + nickName);
        log.info("닉네임 전달하는 값" + memberService.nicknameDoubleCheck(nickName));

        return memberService.nicknameDoubleCheck(nickName);
    }

    @PostMapping("/get-current-user-nickname/{currentUserValue}")
    public String currentUserNicknameCheck(@PathVariable("currentUserValue") String currentUserValue) {
        log.info("currentUserNicknameCheck : " + currentUserValue);

        return memberService.findCurrentUserNickName(currentUserValue);
    }
}

