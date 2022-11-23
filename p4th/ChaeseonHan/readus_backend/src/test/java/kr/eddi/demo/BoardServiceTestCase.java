package kr.eddi.demo;

import kr.eddi.demo.controller.form.BoardModifyForm;
import kr.eddi.demo.entity.CommunityBoard;
import kr.eddi.demo.repository.CommunityBoardRepository;
import kr.eddi.demo.service.BoardServiceImpl;
import kr.eddi.demo.service.request.BoardWriteRequest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;
import java.util.List;

@SpringBootTest
public class BoardServiceTestCase {

    @Autowired
    private BoardServiceImpl service;

    @Autowired
    private CommunityBoardRepository repository;

    @Test
    void writeBoardTest() {
        BoardWriteRequest boardWriteRequest = new BoardWriteRequest("정보", "십이국기 신작은", "정말 출간되긴할까요?", "test123@gmail.com");
        Boolean isItOk = service.write(boardWriteRequest);
        System.out.println("answer: " + isItOk);
    }

    @Test
    void modifyBoardTest() {
        BoardModifyForm boardModifyForm = new BoardModifyForm("일상", "수정테스트", "과연");
        service.modify(10L, boardModifyForm);
    }

    @Test
    void deleteBoardTest() {
        Boolean isDeleted = service.delete(2l);
        System.out.println("is deleted?: " + isDeleted);
    }

    @Test
    @Transactional
    void getMemberBoardTest() {
        List<CommunityBoard> list = service.memberBoardList(2l);
        System.out.println("list?: " + list);
    }
}
