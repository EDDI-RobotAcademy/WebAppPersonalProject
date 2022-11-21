package kr.eddi.demo.service;

import kr.eddi.demo.entity.CommunityBoard;
import kr.eddi.demo.controller.form.BoardModifyForm;
import kr.eddi.demo.service.request.BoardWriteRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BoardService {

    Boolean write(BoardWriteRequest boardWriteRequest);

    List<CommunityBoard> temporaryBoardList();

    Page<CommunityBoard> pageList(Pageable pageable);

    Boolean modify(Long boardNo, BoardModifyForm boardModifyForm);

    CommunityBoard read(Long boardNo);

    Boolean delete(Long boardNo);

    List<CommunityBoard> categoryBoardList(String category);
}
