package kr.eddi.LeaningHelper.service.learning;

import kr.eddi.LeaningHelper.request.learning.WordItemsModifyRequest;
import kr.eddi.LeaningHelper.respones.learning.WordResponseForm;
import kr.eddi.LeaningHelper.request.learning.WordItemsRequest;

import java.util.List;

public interface WordItemsService {

    public boolean createDegree(long degree);

    public boolean wordItemRegister(WordItemsRequest wordItemsRequest);

    public List<WordResponseForm> readWordItems(int Degree);

    public List<Long> readWordDegreeCnt();

    public boolean ModifyWordItem(WordItemsModifyRequest wordItemsModifyRequest);

    public boolean deleteWordItems(Long WordItemId);

}
