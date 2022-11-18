package slide_to_push_backend.service.todosBoard.reqDto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import slide_to_push_backend.entity.member.Account;

@Getter
@ToString
@RequiredArgsConstructor
public class TodosReqDto {
    String content;
    Boolean isFinished;
    String selectedDate;

    Account account;

    public TodosReqDto(String content, Boolean isFinished, String selectedDate, Account account) {
        this.content = content;
        this.isFinished = isFinished;
        this.selectedDate = selectedDate;
        this.account = account;
    }
}
