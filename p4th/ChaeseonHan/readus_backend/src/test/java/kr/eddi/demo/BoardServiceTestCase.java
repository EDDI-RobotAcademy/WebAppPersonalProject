package kr.eddi.demo;

import kr.eddi.demo.controller.form.BoardModifyForm;
import kr.eddi.demo.repository.CommunityBoardRepository;
import kr.eddi.demo.service.BoardServiceImpl;
import kr.eddi.demo.service.request.BoardWriteRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

@SpringBootTest
public class BoardServiceTestCase {

    @Autowired
    private BoardServiceImpl service;

    @Autowired
    private CommunityBoardRepository repository;

    @Test
    void writeBoardTest() {
        BoardWriteRequest boardWriteRequest = new BoardWriteRequest("정보", "안녕하세요", "ddd", "test123@gmail.com");
        Boolean isItOk = service.write(boardWriteRequest);
        System.out.println("answer: " + isItOk);
    }

    @Test
    void communityboardBasicPagination() {
        System.out.println(repository.findWithPagination(Pageable.ofSize(10)).toString());
        System.out.println(  repository.findWithPagination(PageRequest.of(0,2)).toString());

    }

    @Test
    void modifyBoardTest() {
        BoardModifyForm boardModifyForm = new BoardModifyForm("일상", "수정테스트", "과연");
        service.modify(10L, boardModifyForm);
    }
}
