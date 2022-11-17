package slide_to_push_backend.entity.friend;

import lombok.Getter;
import slide_to_push_backend.entity.member.Account;

import javax.persistence.*;

@Entity
public class Friend {

    @Id
    @Getter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Getter
    @OneToOne
    @JoinColumn(name = "my_id")
    private Account myAccount;

    @Getter
    @OneToOne
    @JoinColumn(name = "friend_id")
    private Account friendedAccount;

    // Type - 친구관계가 아니면 0 , 친구관계면 1
    private Boolean isFriended;

    public Friend(Account myAccount, Account friendedAccount, Boolean isFriended) {
        this.myAccount = myAccount;
        this.friendedAccount = friendedAccount;
        this.isFriended = isFriended;
    }
}
