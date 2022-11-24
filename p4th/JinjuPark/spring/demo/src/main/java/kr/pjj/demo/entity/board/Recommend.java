package kr.pjj.demo.entity.board;

import kr.pjj.demo.entity.member.Member;
import lombok.*;

import javax.persistence.*;

@Data
@Entity
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Recommend {

    //추천 id, 보드No, 멤버id , 추천여부, 비추천여부
    @Id
    @Getter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "board_id", nullable = false)
    private Diary diary;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id", nullable = false)
    private Member member;

    @Getter
    @Column(nullable = false)
    private boolean thumbUpFlag = false;

    @Getter
    @Column(nullable = false)
    private boolean thumbDownFlag = false;

    public boolean getThumbUpFlag() {
        return thumbUpFlag;
    }

    public boolean getThumbDownFlag() {
        return thumbDownFlag;
    }
}
