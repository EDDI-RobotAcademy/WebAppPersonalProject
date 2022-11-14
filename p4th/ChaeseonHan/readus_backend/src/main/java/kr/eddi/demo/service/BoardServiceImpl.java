package kr.eddi.demo.service;

import kr.eddi.demo.entity.CommunityBoard;
import kr.eddi.demo.entity.ReadUsMember;
import kr.eddi.demo.repository.CommunityBoardRepository;
import kr.eddi.demo.repository.MemberRepository;
import kr.eddi.demo.controller.form.BoardModifyForm;
import kr.eddi.demo.service.request.BoardWriteRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;


@Service
@Slf4j
public class BoardServiceImpl implements BoardService{

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private CommunityBoardRepository boardRepository;


    @Override
    @Transactional
    public Boolean write(BoardWriteRequest boardWriteRequest) {

        Optional<ReadUsMember> maybeMember = memberRepository.findByEmail(boardWriteRequest.getMemberEmail());

        if(maybeMember.isPresent()) {
            ReadUsMember member = maybeMember.get();
            CommunityBoard board = boardWriteRequest.toCommunityboard(member);
            board.updateBoardToMember();
            boardRepository.save(board);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<CommunityBoard> temporaryBoardList(){

        return boardRepository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    };

    @Override
    public Page<CommunityBoard> pageList(Pageable pageable){


        return null;
    }

    @Override
    @Transactional
    public Boolean modify(Long boardNo, BoardModifyForm boardModifyForm) {
        Optional<CommunityBoard> maybeBoard = boardRepository.findById(boardNo);
        if(maybeBoard.equals(Optional.empty())) {
            log.info("Can't modify board!");
            return false;
        }

        CommunityBoard board = maybeBoard.get();
        board.setCategory(boardModifyForm.category);
        board.setTitle(boardModifyForm.title);
        board.setContents(boardModifyForm.contents);
        board.updateBoardToMember();
        boardRepository.save(board);
        return true;
    }

    @Override
    public CommunityBoard read(Long boardNo) {

        Optional<CommunityBoard> maybeBoard = boardRepository.findById(boardNo);

        if(maybeBoard.equals(Optional.empty())) {
            log.info("Can't read board!");
            return null;
        }

        CommunityBoard board = maybeBoard.get();
        return board;
    }

    @Override
    public Boolean delete(Long boardNo) {
        return null;
    }
}
