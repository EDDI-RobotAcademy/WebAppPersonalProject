package slide_to_push_backend.service.todosBoard;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import slide_to_push_backend.controller.todosBoard.request.TodosRequest;
import slide_to_push_backend.entity.todosBoard.Todos;
import slide_to_push_backend.repository.todosBoard.TodosRepository;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;


@Slf4j
@Service
public class TodosServiceImpl implements TodosService{

    @Autowired
    TodosRepository repository;

    @Override
    public List<Todos> list() {
        return repository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    }

    @Override
    public void register(TodosRequest todosRequest) throws ParseException {
        Todos todos = new Todos();

        //전달받은 날짜 형변환 String > Date
        SimpleDateFormat changeDateType = new SimpleDateFormat("yyyy-MM-dd");
        Date selectedDate = changeDateType.parse(todosRequest.getSelectedDate());

        todos.setSelectedDate(selectedDate);
        todos.setContent(todosRequest.getContent());
        todos.setIsFinished(todosRequest.getIsFinished());

        repository.save(todos);
    }

    @Override
    public Todos changeStatus(Long boardNo) {
        Optional<Todos> maybeBoard = repository.findByBoardNo(boardNo);

        try {
            if (maybeBoard.isPresent()) {
                Todos todos = maybeBoard.get();

                log.info(" boardNo: " + todos.getBoardNo());
                log.info(" check: " + todos.getIsFinished());

                if (todos.getIsFinished() != true) {
                    todos.setIsFinished(true);
                } else {
                    todos.setIsFinished(false);
                }
                repository.save(todos);


                return todos;
            }
        } catch (Exception e) {
            log.info(e.getMessage());
        }

        return null;
    }
    @Override
    public void modify(Todos todos) {
        repository.save(todos);
    }

    @Override
    public void remove(Long boardNo) {
        repository.deleteById(boardNo);
    }
}
