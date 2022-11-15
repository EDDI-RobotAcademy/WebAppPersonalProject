package kr.eddi.demo;


import kr.eddi.demo.service.CommentServiceImpl;
import kr.eddi.demo.service.request.CommentWriteToBoardRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class CommentServiceTestCase {

    @Autowired
    CommentServiceImpl service;

    @Test
    void writeComment() {
        CommentWriteToBoardRequest request = new CommentWriteToBoardRequest(2L, 2L, "댓글 작성 기능 완료" );
        boolean isCommentSuccess = service.write(request);
        System.out.println("isCommentSuccess?: " + isCommentSuccess);
    }

}
