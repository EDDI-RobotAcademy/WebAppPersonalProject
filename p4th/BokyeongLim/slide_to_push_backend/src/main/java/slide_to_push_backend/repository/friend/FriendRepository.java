package slide_to_push_backend.repository.friend;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import slide_to_push_backend.entity.friend.Friend;
import slide_to_push_backend.entity.member.Account;

import java.util.List;
import java.util.Optional;

public interface FriendRepository extends JpaRepository<Friend, Long> {
    @Query("select f from Friend f where f.myAccount = :myAccount")
    List<Friend> findByAccount(Account myAccount);

    @Query("select f from Friend f where f.myAccount = :myAccount and f.friendedAccount = :friendedAccount")
    Friend findByOurAccount(Account myAccount, Account friendedAccount);

    @Query("select f from Friend f where f.myAccount = :myAccount and f.friendedAccount = :friendedAccount")
    Optional<Friend> alreadyExist(Account myAccount, Account friendedAccount);
}