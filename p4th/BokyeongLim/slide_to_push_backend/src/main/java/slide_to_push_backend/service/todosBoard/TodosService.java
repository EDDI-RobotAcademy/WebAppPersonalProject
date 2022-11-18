package slide_to_push_backend.service.todosBoard;

import slide_to_push_backend.controller.todosBoard.request.TodosRequest;
import slide_to_push_backend.entity.todosBoard.Todos;

import java.util.List;

public interface TodosService {

    public List<Todos> list();
    public void register(TodosRequest todosRequest);

//    public Board read(Long boardNo);
//    public void modify(Board board);
//    public void remove(Long boardNo);
}