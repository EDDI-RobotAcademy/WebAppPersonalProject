package slide_to_push_backend.controller.todosBoard;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import slide_to_push_backend.controller.todosBoard.request.TodosRequest;
import slide_to_push_backend.entity.member.Account;
import slide_to_push_backend.entity.todosBoard.Todos;
import slide_to_push_backend.service.member.MemberService;
import slide_to_push_backend.service.todosBoard.reqDto.TodosReqDto;
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

    @Autowired
    MemberService memberService;


    @GetMapping(path = "/list", headers = "Authentication")
    public List<Todos> todoList(@RequestHeader("Authentication") String token) {
        log.info("통신 했음" + token);
        Account account = memberService.findAccount(token);
        return service.list(account);
    }

    @PostMapping("/register")
    public void registerMyTodo(@RequestBody TodosRequest todosRequest) throws ParseException {
        Account account = memberService.findAccount(todosRequest.getToken());
        TodosReqDto reqDto = new TodosReqDto(
                todosRequest.getContent(),
                todosRequest.getIsFinished(),
                todosRequest.getSelectedDate(),
                account
        );
        service.register(reqDto);
    }

    @DeleteMapping("/{boardNo}")
    public void deleteMyTodo (@PathVariable("boardNo") Long boardNo) {
        log.info("deleteMyTodo()");

        service.remove(boardNo);
    }

    @PutMapping("/{boardNo}")
    public Todos changeStatus (@PathVariable("boardNo") Long boardNo) {
        return service.changeStatus(boardNo);
    }

}
