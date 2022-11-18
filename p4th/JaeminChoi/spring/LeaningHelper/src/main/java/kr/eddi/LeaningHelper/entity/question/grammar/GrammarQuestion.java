package kr.eddi.LeaningHelper.entity.question.grammar;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GrammarQuestion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long grammarQuestion_No;

    @Column(name = "grammarQuestion_Title",nullable = false)
    private String Title;

    @Column(nullable = false)
    private String BodyOfQuestion;

    @Column(nullable = false, length = 1)
    private Long rightAnswer;

    @Column(nullable = false)
    private String explanation;

    @Column(length = 1)
    private Long StudentAnswer;

    public GrammarQuestion(String Title,String BodyOfQuestion,Long rightAnswer,String explanation) {
        this.Title = Title;
        this.BodyOfQuestion = BodyOfQuestion;
        this.rightAnswer = rightAnswer;
        this.explanation = explanation;
    }


    public GrammarQuestion(Long studentAnswer) {
        this.StudentAnswer = studentAnswer;
    }
}
