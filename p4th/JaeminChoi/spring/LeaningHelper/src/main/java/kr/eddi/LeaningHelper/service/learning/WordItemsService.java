package kr.eddi.LeaningHelper.service.learning;

import kr.eddi.LeaningHelper.respones.learning.WordResponseForm;
import kr.eddi.LeaningHelper.request.learning.WordItemsRequest;

import java.util.List;

public interface WordItemsService {

    public boolean wordItemRegister(WordItemsRequest wordItemsRequest);

    public List<WordResponseForm> readWordItems(long Degree);

    public long readWordDegreeCnt();

    public boolean updateWordItems(WordItemsRequest wordItemsRequest);

    public boolean deleteWordItems(WordItemsRequest wordItemsRequest);

}
