package kr.eddi.demo.service;


import kr.eddi.demo.entity.CommunityBoard;
import kr.eddi.demo.repository.CommunityBoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class SearchServiceImpl implements SearchService{

    @Autowired
    CommunityBoardRepository boardRepository;

    @Override
    @Transactional
    public List<CommunityBoard> searchBoardWithTitleAndContents(String keyword) {
        List<CommunityBoard> searchList = boardRepository.findByContentsIgnoreCaseOrTitleContainingIgnoreCase(keyword, keyword, Sort.by(Sort.Direction.DESC, "boardNo"));

        if(searchList.size() == 0) {
            return null;
        }

        return searchList;

    }

}
