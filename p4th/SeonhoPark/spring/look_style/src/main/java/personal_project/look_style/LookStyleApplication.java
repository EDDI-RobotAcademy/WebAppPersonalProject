package personal_project.look_style;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.annotation.PostConstruct;
import java.util.Date;
import java.util.TimeZone;

@SpringBootApplication
public class LookStyleApplication {

	@PostConstruct
	public void started() {
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
		System.out.println("íėŽėę° : " + new Date());
	}

	public static void main(String[] args) {
		SpringApplication.run(LookStyleApplication.class, args);
	}

}
