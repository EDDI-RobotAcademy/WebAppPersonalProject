package personal_project.look_style.entity.board;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import personal_project.look_style.entity.member.Member;

import javax.persistence.*;

@Data
@Entity
public class BoardImage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long imageNo;

    @Column
    private String imageName;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "board_id")
    private Board board;

    public void setBoard(Board board) {
        this.board = board;
    }
}
