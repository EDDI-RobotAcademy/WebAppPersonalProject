package com.example.look_lend_backend.service.board;

import com.example.look_lend_backend.entity.board.CommunityBoard;
import com.example.look_lend_backend.repository.board.CommunityBoardRepository;
import com.example.look_lend_backend.service.board.request.CommunityBoardRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class CommunityBoardServiceImpl implements CommunityBoardService {

    @Autowired
    CommunityBoardRepository repository;


    @Override
    public void register(CommunityBoardRequest communityBoardRequest) {
        CommunityBoard communityBoard = new CommunityBoard();
        communityBoard.setType(communityBoardRequest.getType());
        communityBoard.setTitle(communityBoardRequest.getTitle());
        communityBoard.setContent(communityBoardRequest.getContent());
        communityBoard.setWriter(communityBoardRequest.getWriter());

        repository.save(communityBoard);
    }

    @Override
    public List<CommunityBoard> list() {
        return repository.findAll(Sort.by(Sort.Direction.DESC,"communityNo"));
    }

    @Override
    public CommunityBoard read(Long communityNo) {
       Optional<CommunityBoard> maybeCommunityBoard = repository.findById(communityNo);

       if(maybeCommunityBoard.equals(Optional.empty())) {
           log.info("Can't read communityBoard info!!!");
           return null;
       }

       return maybeCommunityBoard.get();
    }

    @Override
    public void modify(CommunityBoard communityBoard) {
        repository.save(communityBoard);
    }

    @Override
    public void remove(Long communityNo) {
        repository.deleteById(communityNo);
    }
}
