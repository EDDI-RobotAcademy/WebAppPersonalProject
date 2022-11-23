package kr.pjj.demo.entity.video;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@Getter
@NoArgsConstructor
public class Video {
    @Id
    @Column(name="video_id")
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String src;


    public Video(String src){
        this.src = src;
    }
}
