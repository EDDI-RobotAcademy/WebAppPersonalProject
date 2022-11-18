package kr.eddi.demo.repository;

import kr.eddi.demo.entity.CommunityBoard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface CommunityBoardRepository extends JpaRepository<CommunityBoard, Long> {

}
