package kr.eddi.demo.repository;

import kr.eddi.demo.entity.BoardComment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository extends JpaRepository<BoardComment, Long> {
}
