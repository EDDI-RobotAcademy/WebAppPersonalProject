package kr.eddi.LeaningHelper.controller.Member;

import kr.eddi.LeaningHelper.form.MemberSignInForm;
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
    @PostMapping("/sing-in")
    public String memberSinIn(@RequestBody MemberSignInForm memberSignInForm){
        log.info("memberSinIn(): " + memberSignInForm);

        return service.signIn(memberSignInForm.toMemberSignInRequest());
    }

}
