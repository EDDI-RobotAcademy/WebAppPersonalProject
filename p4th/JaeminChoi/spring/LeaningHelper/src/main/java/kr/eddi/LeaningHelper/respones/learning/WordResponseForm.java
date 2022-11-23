package kr.eddi.LeaningHelper.respones.learning;

import lombok.Data;

@Data
public class WordResponseForm {

    private  final Long wordId;
    private  final String word;
    private  final String meaning;
    private final String synonym;
    private final String antonym;
    private final String example;

    public WordResponseForm(Long wordId, String word, String  meaning,String  synonym,String antonym, String example){
        this.wordId = wordId;
        this.word = word;
        this.meaning = meaning;
        this.synonym =synonym;
        this.antonym = antonym;
        this.example = example;
    }
}
