package personal_project.look_style.entity.board;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@Entity
public class Board {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long boardNo;

    @Column(length = 128, nullable = false)
    private String title;

    @Column(length = 32, nullable = false)
    private String writer;

    @Lob
    private String content;

    @OneToMany(mappedBy = "board", fetch = FetchType.EAGER)
    private List<BoardImage> image = new ArrayList<>();

    @CreationTimestamp
    private Date regDate;

    @UpdateTimestamp
    private Date updDate;

    @Column
    private String boardType;
}
