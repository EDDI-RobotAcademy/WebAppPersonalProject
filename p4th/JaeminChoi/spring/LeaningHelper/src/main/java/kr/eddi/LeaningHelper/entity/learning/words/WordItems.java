package kr.eddi.LeaningHelper.entity.learning.words;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WordItems {

    private Long degree;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long wordsItemsNo;

    @Column(nullable = false)
    private String word;

    @Column(name = "words_meaning", nullable = false)
    private String meaning;

    @CreationTimestamp
    private Date regDate;

    @UpdateTimestamp
    private Date updDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "WordsDegree_wordsDegreeId")
    private WordsDegree wordsDegree;

    public WordItems(String word, String meaning , Long degree){
        this.word = word;
        this.meaning = meaning;
        this.degree = degree;
    }

    public void modifyWordItems (String word, String meaning, Long degree){
        this.word = word;
        this.meaning = meaning;
        this.degree = degree;
    }
}
