package kr.eddi.LeaningHelper.entity.learning.words;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WordsDegree {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long wordsDegreeId;

    @Column(name = "wordsDegree", nullable = false)
    private Long Degree;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "WordsItems_wordsItemsNo")
    public List<WordItems> wordItemsList = new ArrayList<>();

    public WordsDegree(Long Degree){this.Degree = Degree;}

    public void setWordItems (WordItems wordItems){
        wordItemsList.add(wordItems);
        wordItems.setWordsDegree(this);
    }
}
