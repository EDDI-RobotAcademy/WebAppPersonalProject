package slide_to_push_backend.service.friend;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import slide_to_push_backend.entity.friend.Friend;
import slide_to_push_backend.entity.member.Account;
import slide_to_push_backend.repository.friend.FriendRepository;
import slide_to_push_backend.repository.member.AccountRepository;

import java.util.List;
import java.util.Objects;
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
    public Boolean add(Account myAccount, String friendEmail) {
        Account friendAccount = acquireFriendAccount(friendEmail);

        // 나를 친구로 추가 못하게!
        if(Objects.equals(myAccount.getId(), friendAccount.getId())) {
            return false;
        }

        // 이미 존재하는치 확인
        Optional<Friend> isAdded = friendRepository.alreadyExist(myAccount, friendAccount);
        if(isAdded.isPresent()) {
            return false;
        }

        Friend mine = new Friend(myAccount, friendAccount);
        Friend yours = new Friend(friendAccount, myAccount);

        friendRepository.save(mine);
        friendRepository.save(yours);

        return true;
    }

    @Override
    public void remove(Account myAccount, String friendEmail) {
        // 친구의 email 값으로 친구 Account 찾기
        Account friendAccount = acquireFriendAccount(friendEmail);

        Friend mine = friendRepository.findByOurAccount(myAccount, friendAccount);
        Friend yours = friendRepository.findByOurAccount(friendAccount, myAccount);

        friendRepository.delete(mine);
        friendRepository.delete(yours);
    }

    public Account acquireFriendAccount(String friendEmail) {
        Optional<Account> maybeFriendAccount = accountRepository.findByEmail(friendEmail);
        Account friendAccount;
        if (maybeFriendAccount.isPresent()) {
            friendAccount = maybeFriendAccount.get();
            return friendAccount;
        }

        return null;
    }


}
