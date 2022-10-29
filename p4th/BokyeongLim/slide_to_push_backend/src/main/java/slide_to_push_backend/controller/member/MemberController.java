package slide_to_push_backend.controller.member;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import slide_to_push_backend.controller.member.form.MemberSignInForm;
import slide_to_push_backend.controller.member.form.MemberRegisterForm;
import slide_to_push_backend.service.member.MemberService;

@Slf4j
@RestController
@RequestMapping("/member")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class MemberController {

    @Autowired
    private MemberService service;
    @PostMapping("/sign-in")
    public String memberSignIn (@RequestBody MemberSignInForm form) {
        log.info("memberSignIn(): " + form);

        return service.signIn(form.toMemberSignInRequest());
    }

    @PostMapping("/sign-up")
    public Boolean memberRegister (@RequestBody MemberRegisterForm form) {
        log.info("memberRegister(): " + form);

        return service.signUp(form.toMemberRegisterRequest());
    }

}
