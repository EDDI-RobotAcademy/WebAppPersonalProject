package personal_project.look_style.controller.member;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import personal_project.look_style.controller.member.form.MemberSignInForm;
import personal_project.look_style.controller.member.form.MemberSignUpForm;
import personal_project.look_style.service.member.MemberService;

import java.util.Map;

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
    public Boolean signUp(@RequestBody MemberSignUpForm form) {
        log.info("signUp: " + form);

        return service.signUp(form.toMemberSignUpRequest());
    }

    @PostMapping("/sign-in")
    public String memberSignIn(@RequestBody MemberSignInForm form) {
        log.info("memberSignIn : " + form);

        return service.signIn(form.toSignInRequest());
    }

    @PostMapping ("/send-info")
    public Map sendInfo(@RequestBody MemberSignInForm form) {
        log.info("sendInfo : " + form);

        return service.sendUserInfo(form.toSignInRequest());
    }
}
