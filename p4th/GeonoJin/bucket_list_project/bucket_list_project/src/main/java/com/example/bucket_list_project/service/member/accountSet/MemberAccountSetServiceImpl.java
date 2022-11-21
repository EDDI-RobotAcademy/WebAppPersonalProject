package com.example.bucket_list_project.service.member.accountSet;

import com.example.bucket_list_project.entity.Board.BucketBoard;
import com.example.bucket_list_project.entity.member.MemberInfo;
import com.example.bucket_list_project.repository.bucketBoard.BucketBoardRepository;
import com.example.bucket_list_project.repository.member.MemberRepository;
import com.example.bucket_list_project.service.member.request.accountSet.ReplaceNicknameRequest;
import com.example.bucket_list_project.service.member.security.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import java.util.Optional;

@Slf4j
@Service
public class MemberAccountSetServiceImpl implements MemberAccountSetService {

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private RedisService redisService;

    @Override
    public void replaceNickname(ReplaceNicknameRequest nicknameRequest) {
        String tokenValue = nicknameRequest.getCurrentUserToken();
        Long userId = redisService.getValueByKey(tokenValue);

        Optional<MemberInfo> findMember = memberRepository.findById(userId);

        findMember.ifPresent(selectUser->{
            MemberInfo userInfo = findMember.get();
            selectUser.setEmail(userInfo.getEmail());
            selectUser.setNickName(nicknameRequest.getNickName());

            memberRepository.save(selectUser);
        });
    }

    @Override
    public void deleteUserinfo(String nickName) {
        Optional<MemberInfo> maybeMember = memberRepository.findByMemberNickname(nickName);

        if (maybeMember.isPresent()) {
            MemberInfo memberInfo = maybeMember.get();

            memberRepository.delete(memberInfo);
        }
    }
}
