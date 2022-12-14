package kr.eddi.LeaningHelper.form.learningForm;

import kr.eddi.LeaningHelper.request.learning.WordItemsRequest;
import lombok.Data;

@Data
public class WordItemsRegisterForm {
    private String word;
    private String meaning;
    private String synonym;
    private String antonym;
    private String example;
    private Long degree;


    public WordItemsRequest toWordItemsRequest (){
        return new WordItemsRequest(
               word,
                meaning,
                synonym,
                antonym,
                example,
                degree
        );
    }
}
