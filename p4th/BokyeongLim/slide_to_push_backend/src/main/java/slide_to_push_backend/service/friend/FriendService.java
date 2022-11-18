package slide_to_push_backend.service.friend;

import slide_to_push_backend.entity.friend.Friend;
import slide_to_push_backend.entity.member.Account;

import java.util.List;

public interface FriendService {

    public List<String> list(Account account);
}
