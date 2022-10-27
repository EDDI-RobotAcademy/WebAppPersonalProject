package kr.eddi.LeaningHelper.repository.Member;
import kr.eddi.LeaningHelper.entity.member.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;


public interface MemberRepository extends JpaRepository<Member,Long> {

}
