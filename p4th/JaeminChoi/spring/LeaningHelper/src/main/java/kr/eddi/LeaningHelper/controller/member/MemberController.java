package kr.eddi.LeaningHelper.controller.member;

import kr.eddi.LeaningHelper.form.memberForm.MemberSignInForm;
import kr.eddi.LeaningHelper.form.memberForm.MemberSignUpForm;
import kr.eddi.LeaningHelper.service.member.MemberService;
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
    @PostMapping("/sign-in")
    public String memberSignIn(@RequestBody MemberSignInForm memberSignInForm){
        log.info("memberSignIn(): " + memberSignInForm);

        return service.signIn(memberSignInForm.toMemberSignInRequest());
    }

    @PostMapping("/sign-up")
    public boolean memberSignUp(@RequestBody MemberSignUpForm memberSignUpForm){
        log.info("memberSignUp()" + memberSignUpForm);

        return service.memberSignUp(memberSignUpForm.toMemberRegisterRequest());
    }

    @PostMapping("/check-email/{email}")
    public Boolean emailValidation(@PathVariable("email")  String email) {
        log.info("emailValidation(): " + email);
        String tmp = service.emailValidation(email).toString();

        log.info(tmp);
        return service.emailValidation(email);
    }

    @PostMapping("/check-email/{nickName}")
    public Boolean nickNameValidation(@PathVariable("nickName")  String nickName) {
        log.info("nickNameValidation(): " + nickName);
        String tmp = service.nickNameValidation(nickName).toString();

        log.info(tmp);
        return service.nickNameValidation(nickName);
    }

}
