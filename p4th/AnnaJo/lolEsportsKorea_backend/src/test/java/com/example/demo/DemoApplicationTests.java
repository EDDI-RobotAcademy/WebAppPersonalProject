package com.example.demo;

import com.example.demo.entity.test.MemberTest;
import com.example.demo.repository.test.MemberTestRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class DemoApplicationTests {

	@Autowired
	private MemberTestRepository repository;

	@Test
	void registerMemberTest() {
		MemberTest memberTest = new MemberTest("test", "gogosing");
		repository.save(memberTest);
	}
}
