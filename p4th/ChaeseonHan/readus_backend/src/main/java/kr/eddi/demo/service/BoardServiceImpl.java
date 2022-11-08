package kr.eddi.demo.service;

import kr.eddi.demo.entity.CommunityBoard;
import kr.eddi.demo.entity.ReadUsMember;
import kr.eddi.demo.repository.CommunityBoardRepository;
import kr.eddi.demo.repository.MemberRepository;
import kr.eddi.demo.service.request.BoardModifyRequest;
import kr.eddi.demo.service.request.BoardWriteRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;


@Service
public class BoardServiceImpl implements BoardService{

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private CommunityBoardRepository boardRepository;


    @Override
    public Boolean write(BoardWriteRequest boardWriteRequest) {

        Optional<ReadUsMember> maybeMember = memberRepository.findByEmail(boardWriteRequest.getMemberEmail());

        if(!maybeMember.isEmpty()) {
            ReadUsMember member = maybeMember.get();
            CommunityBoard board = boardWriteRequest.toCommunityboard(member);
            boardRepository.save(board);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Boolean modify(BoardModifyRequest boardModifyRequest) {
        return null;
    }

    @Override
    public CommunityBoard read(Long boardNo) {
        return null;
    }

    @Override
    public Boolean delete(Long boardNo) {
        return null;
    }
}
