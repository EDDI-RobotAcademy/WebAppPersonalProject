package LeaningHelper_backEnd.LeaningHelper.request.member;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Data
@ToString
@RequiredArgsConstructor
public class MemberTestGradeRequest {

    private final long wordGrade;

    private final long grammarGrade;

    private final long readingGrade;

    private final long logicGrade;


}
