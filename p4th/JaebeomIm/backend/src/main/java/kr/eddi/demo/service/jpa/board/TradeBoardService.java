package kr.eddi.demo.service.jpa.board;

import kr.eddi.demo.controller.jpa.board.request.TradeBoardRequest;
import kr.eddi.demo.entity.jpa.boards.TradeBoard;

import java.util.List;

public interface TradeBoardService {

    public void register(TradeBoardRequest boardRequest);
    public List<TradeBoard> list();
    public TradeBoard read(Long boardNo);

    public void modify(TradeBoard board);
    public void remove(Long boardNo);
}
