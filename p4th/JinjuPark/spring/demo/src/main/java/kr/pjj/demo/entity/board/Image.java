package kr.pjj.demo.entity.board;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@Getter
@NoArgsConstructor
public class Image {
    @Id
    @Column(name="image_id")
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String originalName;

    @Column
    private String reName;

    @ManyToOne(fetch = FetchType.LAZY)
    private Diary diary;

}
