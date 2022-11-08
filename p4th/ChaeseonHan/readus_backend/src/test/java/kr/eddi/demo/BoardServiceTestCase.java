package kr.eddi.demo;

import kr.eddi.demo.service.BoardServiceImpl;
import kr.eddi.demo.service.request.BoardWriteRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class BoardServiceTestCase {

    @Autowired
    private BoardServiceImpl service;

    @Test
    void writeBoardTest() {
        BoardWriteRequest boardWriteRequest = new BoardWriteRequest("정보", "안녕하세요", "새 도서 출간되었습니다!", "test@gmail.com");
        Boolean isItOk = service.write(boardWriteRequest);
        System.out.println("answer: " + isItOk);
    }
}
