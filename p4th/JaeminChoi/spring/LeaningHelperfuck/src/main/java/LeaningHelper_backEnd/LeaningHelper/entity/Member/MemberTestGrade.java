package LeaningHelper_backEnd.LeaningHelper.entity.Member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Getter
@Embeddable
@NoArgsConstructor
@AllArgsConstructor
public class MemberTestGrade {

    @Column(nullable = true)
    private long  wordGrade;

    @Column(nullable = true)
    private long grammarGrade;

    @Column(nullable = true)
    private long readingGrade;

    @Column(nullable = true)
    private long logicGrade;

    public static MemberTestGrade of(long wordGrade, long grammarGrade, long readingGrade, long logicGrade){
        return new MemberTestGrade(wordGrade,grammarGrade,readingGrade,logicGrade);
    }

}
