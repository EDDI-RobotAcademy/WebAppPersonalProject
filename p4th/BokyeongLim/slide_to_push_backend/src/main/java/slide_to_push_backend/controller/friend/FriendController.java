package slide_to_push_backend.controller.friend;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import slide_to_push_backend.controller.friend.request.ReqFriend;
import slide_to_push_backend.entity.friend.Friend;
import slide_to_push_backend.entity.member.Account;
import slide_to_push_backend.service.friend.FriendService;
import slide_to_push_backend.service.member.MemberService;

import java.util.List;
@Slf4j
@RestController
@RequestMapping("/friend")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class FriendController {

    @Autowired
    MemberService memberService;

    @Autowired
    FriendService friendService;

    @GetMapping(path = "/list", headers = "Authentication")
    public List<Friend> friendList(@RequestHeader("Authentication") String token) {
        log.info("통신 했음" + token);
        Account account = memberService.findAccount(token);
        return friendService.list(account);
    }

    @PostMapping("/add")
    public Boolean addFriend (@RequestBody ReqFriend reqDelete) {
        log.info("addFriend()" + reqDelete.toString());
        Account account = memberService.findAccount(reqDelete.getToken());
        return friendService.add(account, reqDelete.getFriendEmail());
    }

    @DeleteMapping("/delete")
    public void deleteFriend (@RequestBody ReqFriend reqDelete) {
        log.info("deleteFriend()" + reqDelete.toString());

        Account account = memberService.findAccount(reqDelete.getToken());
        friendService.remove(account, reqDelete.getFriendEmail());
    }
}
