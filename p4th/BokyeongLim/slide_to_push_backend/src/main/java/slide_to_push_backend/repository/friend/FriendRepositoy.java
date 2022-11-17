package slide_to_push_backend.repository.friend;


import org.springframework.data.jpa.repository.JpaRepository;
import slide_to_push_backend.entity.friend.Friend;

public interface FriendRepositoy extends JpaRepository<Friend, Long> {

}