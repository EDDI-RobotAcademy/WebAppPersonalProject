package kr.eddi.LeaningHelper.entity.learning.words;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WordsDegree {

    @Id
    @Column(name = "degree_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;

    private Long Degree;

    @OneToMany(mappedBy = "wordsDegree",fetch = FetchType.EAGER)
    final public List<WordItems> wordItemsList = new ArrayList<>();

    public WordsDegree(Long Degree){this.Degree = Degree;}

}
