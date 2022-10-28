package kr.eddi.LeaningHelper.repository.Member;

import kr.eddi.LeaningHelper.entity.member.Member;
import kr.eddi.LeaningHelper.entity.member.MemberProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface MemberProfileRepository extends JpaRepository<MemberProfile,Long> {
}
