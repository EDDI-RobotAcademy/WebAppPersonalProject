package kr.eddi.LeaningHelper;

import kr.eddi.LeaningHelper.entity.member.Member;
import kr.eddi.LeaningHelper.entity.member.MemberAuth;
import kr.eddi.LeaningHelper.entity.member.MemberBasicAuth;
import kr.eddi.LeaningHelper.entity.member.MemberProfile;
import kr.eddi.LeaningHelper.repository.Member.MemberAuthRepository;
import kr.eddi.LeaningHelper.repository.Member.MemberProfileRepository;
import kr.eddi.LeaningHelper.repository.Member.MemberRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

@SpringBootTest
class LeaningHelperApplicationTests {
	@Autowired
	MemberRepository memberRepository;

	@Autowired
	MemberProfileRepository memberProfileRepository;

	@Autowired
	MemberAuthRepository memberAuthRepository;

	@Test
	void contextLoads() {
		String ID = "Test1@test1.com";
		String PW = "123";

		Member member = Member.builder()
				.id(ID)
				.nickName("testMember")
				.build();
		memberRepository.save(member);


		MemberProfile memberProfile = MemberProfile.builder()
						.member(member)
						.memberTestGrade(null)
								.build();
		memberProfileRepository.save(memberProfile);


		final MemberBasicAuth auth = new MemberBasicAuth(member,
				MemberAuth.BASIC_AUTH, PW);

		memberAuthRepository.save(auth);

	}
}
