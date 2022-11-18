package slide_to_push_backend.service.friend;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import slide_to_push_backend.entity.friend.Friend;
import slide_to_push_backend.entity.member.Account;
import slide_to_push_backend.repository.friend.FriendRepository;

import java.util.List;


@Slf4j
@Service
public class FriendServiceImpl implements FriendService{

    @Autowired
    FriendRepository friendRepository;
    @Override
    public List<Friend> list(Account account) {
        log.info("service.list" + friendRepository.findByAccount(account).toString());
        return friendRepository.findByAccount(account);
    }
}
