package kr.eddi.demo.service;

import kr.eddi.demo.entity.CommunityBoard;
import kr.eddi.demo.service.request.BoardModifyRequest;
import kr.eddi.demo.service.request.BoardWriteRequest;

public interface BoardService {

    Boolean write(BoardWriteRequest boardWriteRequest);

    Boolean modify(BoardModifyRequest boardModifyRequest);

    CommunityBoard read(Long boardNo);

    Boolean delete(Long boardNo);

}
