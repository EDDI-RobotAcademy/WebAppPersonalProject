package slide_to_push_backend.repository.todosBoard;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import slide_to_push_backend.entity.member.Account;
import slide_to_push_backend.entity.todosBoard.Todos;

import java.util.List;
import java.util.Optional;

public interface TodosRepository extends JpaRepository<Todos, Long> {
    @Query("select t from Todos t where t.boardNo = :boardNo")
    Optional<Todos> findByBoardNo(Long boardNo);

    @Query("select t from Todos t where t.account = :account")
    List<Todos> findByAccount(Account account);
}
