package kr.eddi.LeaningHelper.request.learning;


import kr.eddi.LeaningHelper.entity.learning.words.WordItems;
import kr.eddi.LeaningHelper.entity.learning.words.WordsDegree;
import kr.eddi.LeaningHelper.entity.member.Member;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Data
@ToString
@RequiredArgsConstructor
public class WordItemsRequest {

    private  final String word;
    private  final String meaning;
    private final String synonym;
    private final String antonym;
    private final String example;

    private final Long degree;

    public WordItems toWordItems () {
        return new WordItems(
                word,
                meaning,
                synonym,
                antonym,
                example
        );
    }
}
