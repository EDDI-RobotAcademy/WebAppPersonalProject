package kr.eddi.LeaningHelper.form.learningForm;

import kr.eddi.LeaningHelper.request.learning.WordItemsRequest;
import lombok.Data;

@Data
public class WordItemsRegisterForm {
    private String word;
    private String meaning;
    private Long degree;

    public WordItemsRequest toWordItemsRequest (){
        return new WordItemsRequest(
                word,
                meaning,
                degree
        );
    }
}
