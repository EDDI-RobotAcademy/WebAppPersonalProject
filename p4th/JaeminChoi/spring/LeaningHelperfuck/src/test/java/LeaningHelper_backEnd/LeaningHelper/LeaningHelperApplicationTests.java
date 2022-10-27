package LeaningHelper_backEnd.LeaningHelper;

import LeaningHelper_backEnd.LeaningHelper.entity.Member.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import LeaningHelper_backEnd.LeaningHelper.reposipory.MemberRepository;

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
