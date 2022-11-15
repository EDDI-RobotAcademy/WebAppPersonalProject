package slide_to_push_backend.entity.todosBoard;

import lombok.Data;
import slide_to_push_backend.entity.member.Account;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
public class Todos {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long boardNo;

    @Lob
    private String content;

    private Boolean isFinished;

    private Date selectedDate;

    @OneToOne
    @JoinColumn(name = "account_id")
    private Account account;

}
