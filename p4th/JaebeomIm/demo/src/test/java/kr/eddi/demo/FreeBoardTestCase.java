package kr.eddi.demo;

import kr.eddi.demo.entity.jpa.boards.FreeBoard;

import kr.eddi.demo.entity.test.TestBoard;
import kr.eddi.demo.repository.board.FreeBoardRepository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;
import java.util.Optional;

@SpringBootTest
public class FreeBoardTestCase {

    @Autowired
    private FreeBoardRepository freeBoardRepository;


    //자유게시판에 글 작성 후 DB에 잘 들어가는지 테스트한다.(완)
    @Test
    void createFreeBoard () {

        Date now = new Date();

        FreeBoard freeBoard = new FreeBoard("제목이다", "작성자다", "thisiscontents", now, now);

        freeBoardRepository.save(freeBoard);
    }

    //빌더 테스트(완)
    @Test
    void buildFreeBoard () {
        Date now = new Date();

        FreeBoard freeBoard =  FreeBoard.builder()
                .title("빌더")
                .writer("작성자임")
                .content("this is builder test")
                .regDate(now)
                .updDate(now)
                .build();

        freeBoardRepository.save(freeBoard);
    }

    //게시글 읽기 테스트 (완)
    @Test
    void readFreeBoard() {
        Optional<FreeBoard> maybeFreeBoard = freeBoardRepository.findById((long) 4);
        FreeBoard freeBoard = maybeFreeBoard.get();
        freeBoardRepository.save(freeBoard);
        System.out.println(freeBoard);
    }

    //게시글 수정 테스트(완)
    @Test
    void modifyFreeBoard () {
        Optional<FreeBoard> maybeFreeBoard = freeBoardRepository.findById((long) 8); //8번게시글이 존재하면 그것을 maybeFreeBoard 에 받아옴.
        FreeBoard freeBoard = maybeFreeBoard.get(); //freeBoard 에 방금 꺼낸 8번 게시글 받아옴.

        freeBoard.modifyFreeBoard("수정을 해보려한다.", "modify lets go"); //수정시행
        freeBoardRepository.save(freeBoard); //수정한 게시글 저장.
        System.out.println(freeBoard); //수정 된 결과를 확인.
    }

    //게시글 삭제 테스트(완)
    @Test
    void deleteFreeBoard() {
        freeBoardRepository.deleteById((long) 8);
    }

}
