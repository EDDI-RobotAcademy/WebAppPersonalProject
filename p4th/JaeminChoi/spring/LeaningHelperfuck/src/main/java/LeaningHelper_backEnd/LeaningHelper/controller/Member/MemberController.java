package LeaningHelper_backEnd.LeaningHelper.controller.Member;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import LeaningHelper_backEnd.LeaningHelper.request.member.MemberRegisterRequest;
import LeaningHelper_backEnd.LeaningHelper.service.member.MemberService;

@Slf4j
@RestController
@RequestMapping("/member")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class MemberController {

    @Autowired
    MemberService service;

    @PostMapping("/check-email/{email}")
    public Boolean emailValidation(@PathVariable("email") String email) {
        log.info("emailValidation(): " + email);

        return service.emailValidation(email);
    }

    @PostMapping("/sign_up")
    public void flutterMemberSign_up(@RequestBody MemberRegisterRequest request) {
        log.info("flutterMemberLogin(): " + request);


    }

}
