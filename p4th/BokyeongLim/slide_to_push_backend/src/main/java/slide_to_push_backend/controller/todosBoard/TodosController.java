package slide_to_push_backend.controller.todosBoard;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import slide_to_push_backend.controller.todosBoard.request.TodosRequest;
import slide_to_push_backend.entity.todosBoard.Todos;
import slide_to_push_backend.service.todosBoard.TodosService;

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

    @GetMapping("/register")
    public void registerMyTodo(@RequestBody TodosRequest todosRequest) {
        log.info("우선 포스트맨으로 저장되나 테스트");
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
