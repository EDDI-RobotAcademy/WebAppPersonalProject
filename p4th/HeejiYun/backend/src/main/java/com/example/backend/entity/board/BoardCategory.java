package com.example.backend.entity.board;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@NoArgsConstructor
public class BoardCategory {

    @Id
    @Column(name = "board_category_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long categoryId;
    @Column(name = "category_name")
    private String categoryName;

    @OneToMany(mappedBy = "boardCategory", fetch = FetchType.EAGER)
    private List<Board> boards = new ArrayList<>();

    public BoardCategory (String categoryName) {
        this.categoryName = categoryName;
    }

    public void setBoard (Board board) {
        boards.add(board);
        board.setBoardCategory(this);
    }
}
