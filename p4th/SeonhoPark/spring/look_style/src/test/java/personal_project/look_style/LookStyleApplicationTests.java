package personal_project.look_style;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import personal_project.look_style.controller.member.form.MemberSignInForm;

@SpringBootTest
class LookStyleApplicationTests {

//	@Autowired
//	private MemberRepository memberRepository;
//
//	@Autowired
//	private RedisService redisService;

	@Test
	void contextLoads() {
	}

//	@Test
//	Map<String, String> signIn() {
//		MemberSignInForm request = new MemberSignInForm("test@test.com", "q123123!");
//		Map<String, String> userInfo = new HashMap<>();
//		String email = request.getEmail();
//		Optional<Member> maybeMember = memberRepository.findByEmail(email);
//
//		if (maybeMember.isPresent()) {
//			Member member = maybeMember.get();
//
//			System.out.println("멤버: " + maybeMember.get());
//			System.out.println("member email: " + member.getEmail());
//			System.out.println("request email: " + request.getEmail());
//			System.out.println("request password: " + request.getPassword());
//
//			if (!member.isRightPassword(request.getPassword())) {
//				throw new RuntimeException("패스워드가 잘못됨!");
//			}
//
//			UUID userToken = UUID.randomUUID();
//
//			redisService.deleteByKey(userToken.toString());
//			redisService.setKeyAndValue(userToken.toString(), member.getId());
//
//			userInfo.put("email", member.getEmail());
//			userInfo.put("nickname", member.getNickname());
//			userInfo.put("token", userToken.toString());
//
//			System.out.println(userInfo);
//			return userInfo;
//		}
//
//		throw new RuntimeException("가입된 사용자가 아님!");
//	}
//
//	@Test
//	void send() {
//		System.out.println(signIn());
//	}

}
