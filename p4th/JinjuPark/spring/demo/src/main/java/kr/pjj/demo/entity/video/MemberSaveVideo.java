package kr.pjj.demo.entity.video;

import kr.pjj.demo.entity.member.Member;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@Getter
@NoArgsConstructor
public class MemberSaveVideo { // 회원이 세이브한 비디오

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    private Member member;

    @ManyToOne(fetch = FetchType.LAZY)
    private Video video;

}
