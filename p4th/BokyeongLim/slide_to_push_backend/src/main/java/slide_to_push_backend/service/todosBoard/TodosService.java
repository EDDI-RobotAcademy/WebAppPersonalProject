package slide_to_push_backend.service.todosBoard;

import slide_to_push_backend.entity.member.Account;
import slide_to_push_backend.entity.todosBoard.Todos;
import slide_to_push_backend.service.todosBoard.reqDto.TodosReqDto;

import java.text.ParseException;
import java.util.List;

public interface TodosService {

    public List<Todos> list(Account account);
    public void register(TodosReqDto reqDto) throws ParseException;
    public Todos changeStatus (Long boardNo);
    public void modify(Todos todos);
    public void remove(Long boardNo);
}