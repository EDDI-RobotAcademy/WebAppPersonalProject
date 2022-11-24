package kr.pjj.demo.controller.member;

import kr.pjj.demo.controller.member.form.MemberLoginForm;
import kr.pjj.demo.controller.member.form.MemberRegisterForm;
import kr.pjj.demo.controller.member.request.MemberModifyInfo;
import kr.pjj.demo.entity.member.Member;
import kr.pjj.demo.service.member.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("hometwang/member")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
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

        return service.nickNameValidation(nickname);
    }

    @PostMapping("/sign-up")
    public Boolean signUp(@RequestBody MemberRegisterForm form) {
        log.info("signUp: " + form);

        return service.signUp(form.toMemberRegisterRequest());
    }

    @PostMapping("/sign-in")
    public String signIn(@RequestBody MemberLoginForm form) {
        log.info("signIn: " + form);

        return service.signIn(form.toLoginRequest());
    }

    @PostMapping("/login-user")
    public List<Member> loginUserInfo(@RequestBody String loginUserToken){

        return service.loginUserInfo(loginUserToken);
    }

    @PostMapping("/modify-info")
    public String modifyInfo(@RequestBody MemberModifyInfo memberModifyInfo){
        log.info("닉네임 변경 멤버아이디: "+ memberModifyInfo.getMemberId());
        log.info("닉네임 변경 내용: "+ memberModifyInfo.getReNickName());
        Long memberId = memberModifyInfo.getMemberId();
        String reNickName = memberModifyInfo.getReNickName();

        return service.modifyNickName(memberId, reNickName);
    }
}
