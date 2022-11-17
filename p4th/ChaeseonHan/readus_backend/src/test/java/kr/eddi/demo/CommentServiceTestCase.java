package kr.eddi.demo;


import kr.eddi.demo.repository.CommentRepository;
import kr.eddi.demo.service.CommentServiceImpl;
import kr.eddi.demo.service.request.CommentWriteToBoardRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class CommentServiceTestCase {

    @Autowired
    CommentServiceImpl service;

    @Autowired
    CommentRepository repository;

    @Test
    void writeComment() {
        CommentWriteToBoardRequest request = new CommentWriteToBoardRequest(2L, 3L, "댓글 썻어요잉" );
        boolean isCommentSuccess = service.write(request);
        System.out.println("isCommentSuccess?: " + isCommentSuccess);
    }

    @Test
    void modifyComment() {
        boolean isCommentModified = service.modify(2l, "수정완료");
        System.out.println("isCommentModified: " + isCommentModified);
    }

    @Test
    void deleteComment() {
        Boolean isCommentDeleted = service.delete(4l);
        System.out.println("isCommentDeleted: " + isCommentDeleted);
    }

}
