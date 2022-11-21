package kr.eddi.demo.entity.repository.board;


import kr.eddi.demo.entity.boards.Board;

import org.springframework.data.jpa.repository.JpaRepository;



public interface BoardRepository extends JpaRepository<Board, Long> {


}
