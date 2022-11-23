package com.example.bucket_list_project.service.member;

import com.example.bucket_list_project.entity.member.MemberInfo;
import com.example.bucket_list_project.repository.member.MemberRepository;
import com.example.bucket_list_project.service.member.account.MemberService;
import com.example.bucket_list_project.service.member.accountSet.MemberAccountSetService;
import com.example.bucket_list_project.service.member.request.account.MemberSignInRequest;
import com.example.bucket_list_project.service.member.request.accountSet.ReplaceNicknameRequest;
import com.example.bucket_list_project.service.member.security.RedisService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

@SpringBootTest
public class MemberAccountSetTestCase {

    @Autowired
    private MemberService memberService;

    @Autowired
    private MemberAccountSetService memberAccountSetService;

    @Autowired
    private RedisService redisService;

    @Autowired
    private MemberRepository repository;

    @Test
    public void replaceMemberNickname(){
        MemberSignInRequest request = new MemberSignInRequest("sss@sss.com", "sss");
        String token = memberService.signIn(request);

        Long userId = redisService.getValueByKey(token);
        Optional<MemberInfo> maybeUser = repository.findById(userId);

        if (maybeUser.isPresent()) {
            MemberInfo userInfo = maybeUser.get();
            String currentNickname = userInfo.getNickName();
            System.out.println("현재닉네임: "+currentNickname);
        }

        ReplaceNicknameRequest replaceNicknameRequest = new ReplaceNicknameRequest("관리자1", token);
        memberAccountSetService.replaceNickname(replaceNicknameRequest);

        String replaceNickname = memberService.findCurrentUserNickName(token);
        System.out.println("변경된 닉네임: "+replaceNickname);
    }

    @Test
    public void deleteMember() {
        memberAccountSetService.deleteUserinfo("ggg");
    }
}
