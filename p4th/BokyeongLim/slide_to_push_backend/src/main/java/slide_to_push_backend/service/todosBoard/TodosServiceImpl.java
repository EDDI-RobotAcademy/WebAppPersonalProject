package slide_to_push_backend.service.todosBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import slide_to_push_backend.controller.todosBoard.request.TodosRequest;
import slide_to_push_backend.entity.todosBoard.Todos;
import slide_to_push_backend.repository.todosBoard.TodosRepository;

import java.util.List;

@Service
public class TodosServiceImpl implements TodosService{

    @Autowired
    TodosRepository repository;

    @Override
    public List<Todos> list() {
        return repository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    }

    @Override
    public void register(TodosRequest todosRequest) {
        Todos todos = new Todos();
        todos.setContent(todosRequest.getContent());
        todos.setIsFinished(todosRequest.getIsFinished());

        repository.save(todos);
    }
}
