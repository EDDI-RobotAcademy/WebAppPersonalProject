package kr.eddi.demo.service;

import kr.eddi.demo.entity.CommunityBoard;

import javax.transaction.Transactional;
import java.util.List;

public interface SearchService {
    @Transactional
    List<CommunityBoard> searchBoardWithTitleAndContents(String keyword);

    @Transactional
    List<CommunityBoard> searchBoardWithTitle(String keyword);

    @Transactional
    List<CommunityBoard> searchBoardWithContents(String keyword);

    @Transactional
    List<CommunityBoard> searchBoardWithWriter(String keyword);
}
