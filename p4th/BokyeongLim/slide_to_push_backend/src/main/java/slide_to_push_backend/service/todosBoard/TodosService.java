package slide_to_push_backend.service.todosBoard;

import slide_to_push_backend.controller.todosBoard.request.TodosRequest;
import slide_to_push_backend.entity.todosBoard.Todos;

import java.text.ParseException;
import java.util.List;

public interface TodosService {

    public List<Todos> list();
    public void register(TodosRequest todosRequest) throws ParseException;
    public Todos changeStatus (Long boardNo);
    public void modify(Todos todos);
    public void remove(Long boardNo);
}