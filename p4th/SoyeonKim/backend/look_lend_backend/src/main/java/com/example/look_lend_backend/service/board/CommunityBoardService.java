package com.example.look_lend_backend.service.board;

import com.example.look_lend_backend.entity.board.CommunityBoard;
import com.example.look_lend_backend.service.board.request.CommunityBoardRequest;

import java.util.List;

public interface CommunityBoardService {
    public void register (CommunityBoardRequest communityBoardRequest);
    public List<CommunityBoard> list();
    public CommunityBoard read(Long communityNo);
    public void modify(CommunityBoard communityBoard);
    public void remove(Long communityNo);
}
