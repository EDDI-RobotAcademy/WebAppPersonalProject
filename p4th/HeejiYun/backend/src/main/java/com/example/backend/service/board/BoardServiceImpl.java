package com.example.backend.service.board;

import com.example.backend.entity.board.Board;
import com.example.backend.entity.board.BoardCategory;
import com.example.backend.entity.member.Member;
import com.example.backend.repository.BoardCategoryRepository;
import com.example.backend.repository.BoardRepository;
import com.example.backend.repository.MemberRepository;
import com.example.backend.service.board.request.BoardModifyRequest;
import com.example.backend.service.board.request.BoardRegisterRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
@Transactional
public class BoardServiceImpl implements BoardService{

    @Autowired
    MemberRepository memberRepository;

    @Autowired
    BoardCategoryRepository categoryRepository;

    @Autowired
    BoardRepository boardRepository;

    @Override
    public void register(BoardRegisterRequest boardRegisterRequest) {
        BoardCategory boardCategory;
        Member member;
        Optional<BoardCategory> maybeCategory = categoryRepository.findByCategoryName(boardRegisterRequest.getBoardCategoryName());

        if(maybeCategory.isEmpty()) {
            boardCategory = new BoardCategory(boardRegisterRequest.getBoardCategoryName());
        } else {
            boardCategory = maybeCategory.get();
        }
        Optional<Member> maybeMember = memberRepository.findByNickname(boardRegisterRequest.getWriter());

        if(maybeMember.isPresent()) {
            member = maybeMember.get();
        } else {
            throw new RuntimeException("존재하지 않는 사용자 닉네임");
        }

        Board board = new Board();

        board.setTitle(boardRegisterRequest.getTitle());
        board.setContent(boardRegisterRequest.getContent());
        board.setWriter(boardRegisterRequest.getWriter());

        boardCategory.setBoard(board);
        categoryRepository.save(boardCategory);

        member.setBoard(board);
        memberRepository.save(member);

        boardRepository.save(board);
    }

    @Override
    public List<Board> everyBoardList() {

        // System.out.println("board list: " + boardRepository.findAll(Sort.by(Sort.Direction.DESC, "boardNo")));
        return boardRepository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    }

    @Override
    public List<Board> specificBoardList(String categoryName) {
        BoardCategory category;

        Optional<BoardCategory> maybeCategory = categoryRepository.findByCategoryName(categoryName);
        if(maybeCategory.isPresent()) {
            category = maybeCategory.get();
            // System.out.println(boardRepository.findAllBoardsByCategoryId(category.getCategoryId()));

            return boardRepository.findAllBoardsByCategoryId(category.getCategoryId());
        } else {
            throw new RuntimeException("존재하지 않는 게시판");
        }
    }

    @Override
    public Board read(Long boardNo) {
        Optional<Board> maybeBoard = boardRepository.findById(boardNo);

        if (maybeBoard.equals(Optional.empty())) {
            log.info("Can't read board!!!");

            return null;
        }
        // log.info(String.valueOf(maybeBoard.get()));
        return maybeBoard.get();
    }

    @Override
    public Board modify(Long boardNo, BoardModifyRequest boardModifyRequest) {
        Board modifyBoard;
        Optional<Board> maybeBoard = boardRepository.findById(boardNo);
        if(maybeBoard.isPresent()) {
            modifyBoard = maybeBoard.get();
            modifyBoard.setTitle(boardModifyRequest.getTitle());
            modifyBoard.setContent(boardModifyRequest.getContent());
            boardRepository.save(modifyBoard);

            return modifyBoard;
        } else {
            throw new RuntimeException("존재하지 않는 게시물!");
        }
    }

    @Override
    public void remove(Long boardNo) {
        boardRepository.deleteById(boardNo);
    }
}
