package kr.eddi.LeaningHelper;

import kr.eddi.LeaningHelper.entity.member.Member;
import kr.eddi.LeaningHelper.repository.Member.MemberRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class LeaningHelperApplicationTests {
	@Autowired
	MemberRepository repository;

	@Test
	void contextLoads() {
		Member member = Member.builder()
				.id("Test@test.com")
				.pw("123")
				.nickName("testMember")
				.build();

		repository.save(member);

	}
}
