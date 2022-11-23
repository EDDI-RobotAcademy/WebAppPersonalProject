package kr.pjj.demo.repository.board;

import kr.pjj.demo.entity.board.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Long> {

}

