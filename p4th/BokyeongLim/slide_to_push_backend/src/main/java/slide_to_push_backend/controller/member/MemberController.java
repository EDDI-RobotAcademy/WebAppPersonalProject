package slide_to_push_backend.controller.member;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import slide_to_push_backend.controller.member.form.MemberSignInForm;

@Slf4j
@RestController
@RequestMapping("/member")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class MemberController {

    @PostMapping("/sign-in")
    public Boolean memberSignIn (@RequestBody MemberSignInForm memberSignInForm) {
        log.info("memberSignIn(): " + memberSignInForm);
        return true;
    }


}
