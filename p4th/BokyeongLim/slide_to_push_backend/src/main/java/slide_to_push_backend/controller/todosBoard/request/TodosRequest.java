package slide_to_push_backend.controller.todosBoard.request;

import lombok.Data;

@Data
public class TodosRequest {
    String content;
    Boolean isFinished;
}
