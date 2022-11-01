package slide_to_push_backend.entity.member;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;

@Entity
@ToString(exclude = "account")
@NoArgsConstructor
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "authentication_type")
public abstract class Authentication {

    public static final String BASIC_AUTH = "BASIC";

    @Id
    @Getter
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id = null;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "account")
    private Account account;

    @Column(name = "authentication_type", nullable = false, insertable = false, updatable = false)
    private String authenticationType;

    public Authentication(Account account, String authenticationType) {
        this.account = account;
        this.authenticationType = authenticationType;
    }
}