package kr.pjj.demo.entity.board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;


@Data
@Entity
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Category {

    @Id
    @Column(name="category_id")
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String categoryName;

    @Column(nullable = false)
    private Long pageNo;

}
