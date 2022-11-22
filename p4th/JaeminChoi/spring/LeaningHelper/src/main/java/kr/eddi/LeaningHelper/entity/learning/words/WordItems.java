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

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String word;

    @Column(name = "words_meaning", nullable = false)
    private String meaning;

    @Column(name = "words_synonym", nullable = false)
    private String synonym;

    @Column(name = "words_antonym", nullable = false)
    private String antonym;

    @Column(name = "words_example", nullable = false)
    private String example;

    @CreationTimestamp
    private Date regDate;

    @UpdateTimestamp
    private Date updDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "degree_id")
    private WordsDegree wordsDegree;

    public WordItems(String word, String meaning ,String synonym ,String antonym ,String example){
        this.word = word;
        this.meaning = meaning;
        this.synonym = synonym;
        this.antonym = antonym;
        this.example = example;
    }

    public void ModifyWordItems(String word, String meaning ,String synonym ,String antonym ,String example){
        this.word = word;
        this.meaning = meaning;
        this.synonym = synonym;
        this.antonym = antonym;
        this.example = example;
    }
}
