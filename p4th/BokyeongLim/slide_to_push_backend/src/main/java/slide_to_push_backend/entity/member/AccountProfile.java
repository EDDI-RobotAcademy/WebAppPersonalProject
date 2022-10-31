package slide_to_push_backend.entity.member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AccountProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id = null;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id")
    private Account account;

    @Getter
    @Column(nullable = false)
    private String nickName;

    public AccountProfile(String nickName) { this.nickName = nickName; }

    public void setAccount (Account account) {
        this.account = account;
    }

}