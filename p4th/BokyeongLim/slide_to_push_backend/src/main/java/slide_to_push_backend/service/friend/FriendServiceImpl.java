package slide_to_push_backend.service.friend;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import slide_to_push_backend.entity.friend.Friend;
import slide_to_push_backend.entity.member.Account;
import slide_to_push_backend.repository.friend.FriendRepository;
import slide_to_push_backend.repository.member.AccountRepository;

import java.util.List;
import java.util.Optional;


@Slf4j
@Service
public class FriendServiceImpl implements FriendService{

    @Autowired
    FriendRepository friendRepository;

    @Autowired
    AccountRepository accountRepository;

    @Override
    public List<Friend> list(Account account) {
        log.info("service.list" + friendRepository.findByAccount(account).toString());
        return friendRepository.findByAccount(account);
    }

    @Override
    public void remove(Account myAccount, String friendEmail) {
        // 친구의 email 값으로 친구 Account 찾기
        Optional<Account> maybeFriendAccount = accountRepository.findByEmail(friendEmail);

        //Repository에서 친구의 Account까지 찾으면 두 어카운트 값을 넣어 friendRepository의 값을 찾는다.
        //양방으로 2개를 찾아야 한다.
        if (maybeFriendAccount.isPresent()) {
            Account friendedAccount = maybeFriendAccount.get();
            Friend mine = friendRepository.findByOurAccount(myAccount, friendedAccount);
            Friend yours = friendRepository.findByOurAccount(friendedAccount, myAccount);

            friendRepository.delete(mine);
            friendRepository.delete(yours);
        }
    }
}
