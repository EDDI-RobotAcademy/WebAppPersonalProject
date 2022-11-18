package slide_to_push_backend.service.friend;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import slide_to_push_backend.entity.friend.Friend;
import slide_to_push_backend.entity.member.Account;
import slide_to_push_backend.repository.friend.FriendRepository;
import slide_to_push_backend.repository.member.AccountRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class FriendServiceImpl implements FriendService{

    @Autowired
    AccountRepository accountRepository;
    @Autowired
    FriendRepository friendRepository;
    @Override
    public List<String> list(Account account) {
        List<String> friendList = new ArrayList<>();

        // 백로그 : 내 어카운트 ID로 친구들의 ID를 찾는 코드 작성.
        List<Friend> temp = friendRepository.findByAccount(account);

        // 백로그 : 찾은 친구들의 ID로 친구들의 Email을 찾는 코드 작성.
        // 찾은 이메일을 리스트로 저장하는 코드 작성.
        for(int i = 0; i < temp.size(); i++) {
            Account tempFriend = temp.get(i).getFriendedAccount();
            Optional<Account> maybeMember = accountRepository.findByAccount(tempFriend.getId());
            Account foundAccount = maybeMember.get();
            friendList.add(foundAccount.getEmail());
        }

        log.info("리스트 :" + friendList);
        return friendList;
    }
}
