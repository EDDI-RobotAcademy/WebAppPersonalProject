package personal_project.look_style.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import personal_project.look_style.controller.form.MemberSignInForm;
import personal_project.look_style.controller.form.MemberSignUpForm;
import personal_project.look_style.service.member.MemberService;
import personal_project.look_style.service.member.request.MemberSignInRequest;

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
}
