package slide_to_push_backend.controller.todosBoard;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import slide_to_push_backend.controller.todosBoard.request.TodosRequest;
import slide_to_push_backend.entity.todosBoard.Todos;
import slide_to_push_backend.service.todosBoard.TodosService;

import java.text.ParseException;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/todos")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class TodosController {

    @Autowired
    TodosService service;

    @GetMapping("/list")
    public List<Todos> todoList() {
        log.info("통신 했음");
        return service.list();
    }

    @PostMapping("/register")
    public void registerMyTodo(@RequestBody TodosRequest todosRequest) throws ParseException {
        log.info(todosRequest.toString());
        service.register(todosRequest);
    }

    @DeleteMapping("/{boardNo}")
    public void deleteMyTodo (@PathVariable("boardNo") Long boardNo) {
        log.info("deleteMyTodo()");

        service.remove(boardNo);
    }

    @PutMapping("/change-status/{boardNo}")
    public Todos changeStatus (@PathVariable("boardNo") Long boardNo) {
        return service.changeStatus(boardNo);
    }

//    @PutMapping("/{boardNo}")
//    public Todos modifyMyTodo (@PathVariable("boardNo") Long boardNo, @RequestBody Todos todos) {
//        log.info("modifyMyTodo()");
//
//        todos.setBoardNo(boardNo);
//        service.modify(todos);
//
//        return todos;
//    }
}
