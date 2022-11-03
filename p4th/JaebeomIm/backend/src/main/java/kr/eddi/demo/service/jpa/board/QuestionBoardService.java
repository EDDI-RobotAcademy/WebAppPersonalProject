package kr.eddi.demo.service.jpa.board;



import kr.eddi.demo.controller.jpa.board.request.QuestionBoardRequest;
import kr.eddi.demo.entity.jpa.boards.QuestionBoard;

import java.util.List;

public interface QuestionBoardService {
    public void register(QuestionBoardRequest boardRequest);
    public List<QuestionBoard> list();
    public QuestionBoard read(Long boardNo);

    public void modify(QuestionBoard board);
    public void remove(Long boardNo);
}
