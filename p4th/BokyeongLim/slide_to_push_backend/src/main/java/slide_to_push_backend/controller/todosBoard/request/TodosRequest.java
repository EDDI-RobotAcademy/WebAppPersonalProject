package slide_to_push_backend.controller.todosBoard.request;

import lombok.Data;

import java.util.Date;

@Data
public class TodosRequest {
    String content;
    Boolean isFinished;
    String selectedDate;
}
