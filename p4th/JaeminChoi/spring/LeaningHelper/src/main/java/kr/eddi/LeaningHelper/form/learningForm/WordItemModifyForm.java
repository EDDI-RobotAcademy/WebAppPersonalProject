package kr.eddi.LeaningHelper.form.learningForm;

import kr.eddi.LeaningHelper.request.learning.WordItemsModifyRequest;
import kr.eddi.LeaningHelper.request.learning.WordItemsRequest;
import lombok.Data;

@Data
public class WordItemModifyForm {

    private String word;
    private String meaning;
    private String synonym;
    private String antonym;
    private String example;
    private Long wordId;



    public WordItemsModifyRequest toWordItemsModifyRequest (){
        return new WordItemsModifyRequest(
                word,
                meaning,
                synonym,
                antonym,
                example,
                wordId
        );
    }

}
