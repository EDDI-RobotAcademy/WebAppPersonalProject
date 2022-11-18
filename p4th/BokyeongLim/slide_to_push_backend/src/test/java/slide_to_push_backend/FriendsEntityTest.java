package slide_to_push_backend;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import slide_to_push_backend.entity.friend.Friend;
import slide_to_push_backend.entity.member.Account;
import slide_to_push_backend.repository.friend.FriendRepository;
import slide_to_push_backend.repository.member.AccountRepository;

import java.util.Optional;

@SpringBootTest
public class FriendsEntityTest {

    @Autowired
    FriendRepository repository;

    @Autowired
    AccountRepository accountRepository;

    @Test
    void testCreateFriendTable () {

        Long myId = 2L;
        Long friendId = 20L;



        Optional<Account> maybeMember = accountRepository.findByAccount(myId);
        Account myAccount = maybeMember.get();

        Optional<Account> maybeMember2 = accountRepository.findByAccount(friendId);
        Account friendedAccount = maybeMember2.get();

        Friend friend = new Friend(myAccount, friendedAccount);
        Friend friend2 = new Friend(friendedAccount, myAccount);

        repository.save(friend);
        repository.save(friend2);

    }
}
