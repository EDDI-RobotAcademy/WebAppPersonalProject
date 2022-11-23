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


    /**
     * 게시글 작성 메소드
     * 이메일로 작성자 회원 데이터를 찾아 게시글과 함께 등록
     * @param boardWriteRequest
     * @return 작성 성공 여부
     */
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


    /**
     * (임시) 게시글 전체 리스트 메소드
     * @return 게시글 리스트
     */
    @Override
    public List<CommunityBoard> temporaryBoardList(){

        return boardRepository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    };

    @Override
    public Page<CommunityBoard> pageList(Pageable pageable){


        return null;
    }


    /**
     * 게시글 수정 메소드
     * @param boardNo 수정할 게시글 번호
     * @param boardModifyForm 수정할 내용
     * @return 수정 성공 여부
     */

    @Override
    @Transactional
    public Boolean modify(Long boardNo, BoardModifyForm boardModifyForm) {
        Optional<CommunityBoard> maybeBoard = boardRepository.findById(boardNo);
        if(maybeBoard.equals(Optional.empty())) {
            log.info("Can't modify board!");
            return false;
        }

        CommunityBoard board = maybeBoard.get();

        board.modifyBoard(
                boardModifyForm.getCategory(),
                boardModifyForm.getTitle(),
                boardModifyForm.getContents()
        );

        board.updateBoardToMember();
        boardRepository.save(board);
        return true;
    }


    /**
     * 게시글 읽기 메소드
     * @param boardNo 읽을 게시글 번호
     * @return 해당 게시글
     */

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

    /**
     * 게시글 삭제 메소드
     * @param boardNo 삭제할 게시글 번호
     * @return 삭제 성공 여부
     */
    @Override
    @Transactional
    public Boolean delete(Long boardNo) {
        Optional<CommunityBoard> maybeBoard = boardRepository.findById(boardNo);
        if(maybeBoard.equals(Optional.empty())) {
            log.info("Can't find board to delete!");
            return false;
        }

        CommunityBoard board = maybeBoard.get();
        board.deleteBoardToMember();
        boardRepository.delete(board);
        return true;
    }

    @Override
    public List<CommunityBoard> categoryBoardList(String category){

        return boardRepository.findByCategoryContainingIgnoreCase(category, Sort.by(Sort.Direction.DESC, "boardNo"));
    }

}
