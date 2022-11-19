package slide_to_push_backend.controller.friend.request;

import lombok.Data;
import slide_to_push_backend.entity.member.Account;

@Data
public class ReqDeleteFriend {

    String token;
    String friendEmail;

}
