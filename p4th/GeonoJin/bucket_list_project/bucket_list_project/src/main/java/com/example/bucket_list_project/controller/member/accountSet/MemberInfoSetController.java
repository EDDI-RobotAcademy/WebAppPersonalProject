package com.example.bucket_list_project.controller.member.accountSet;

import com.example.bucket_list_project.controller.member.form.account.ReplaceNicknameForm;
import com.example.bucket_list_project.service.member.accountSet.MemberAccountSetService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/member/set")
@CrossOrigin(origins = "http://localhost:8080", allowedHeaders = "*")
public class MemberInfoSetController {

    @Autowired
    private MemberAccountSetService memberService;

    @PostMapping("/changeNickname")
    public void nicknameModify(@RequestBody ReplaceNicknameForm replaceNicknameform) {
        log.info("nicknameModify: " + replaceNicknameform);

        memberService.replaceNickname(replaceNicknameform.toReplaceNicknameRequest());
    }

    @PostMapping("/{nickName}")
    public void deleteMember(@PathVariable("nickName") String nickName) {
        log.info("deleteUser" + nickName);

        memberService.deleteUserinfo(nickName);
    }
}
