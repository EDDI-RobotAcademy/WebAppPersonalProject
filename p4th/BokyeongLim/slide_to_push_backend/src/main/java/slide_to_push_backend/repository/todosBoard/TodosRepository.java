package slide_to_push_backend.repository.todosBoard;

import org.springframework.data.jpa.repository.JpaRepository;
import slide_to_push_backend.entity.todosBoard.Todos;

public interface TodosRepository extends JpaRepository<Todos, Long> {
}
