package com.example.bucket_list_project.controller.member.account;

import com.example.bucket_list_project.controller.member.form.account.MemberSignInForm;
import com.example.bucket_list_project.controller.member.form.account.MemberSignUpForm;
import com.example.bucket_list_project.service.member.account.MemberService;
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

        return memberService.nicknameDoubleCheck(nickName);
    }

    @PostMapping("/get-current-user-nickname/{replacedUserValue}")
    public String currentUserNicknameCheck(@PathVariable("replacedUserValue") String replacedUserValue) {
        log.info("currentUserNicknameCheck: " + replacedUserValue);

        return memberService.findCurrentUserNickName(replacedUserValue);
    }
}

