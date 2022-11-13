package com.example.backend.service.board;

import com.example.backend.entity.board.Board;
import com.example.backend.entity.board.BoardCategory;
import com.example.backend.entity.member.Member;
import com.example.backend.repository.BoardCategoryRepository;
import com.example.backend.repository.BoardRepository;
import com.example.backend.repository.MemberRepository;
import com.example.backend.service.board.request.BoardRequest;
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
    public void register(BoardRequest boardRequest) {
        BoardCategory boardCategory;
        Member member;
        Optional<BoardCategory> maybeCategory = categoryRepository.findByCategoryName(boardRequest.getBoardCategoryName());

        if(maybeCategory.isEmpty()) {
            boardCategory = new BoardCategory(boardRequest.getBoardCategoryName());
        } else {
            boardCategory = maybeCategory.get();
        }
        Optional<Member> maybeMember = memberRepository.findByNickname(boardRequest.getWriter());

        if(maybeMember.isPresent()) {
            member = maybeMember.get();
        } else {
            throw new RuntimeException("존재하지 않는 사용자 닉네임");
        }

        Board board = new Board();

        board.setTitle(boardRequest.getTitle());
        board.setContent(boardRequest.getContent());
        board.setWriter(boardRequest.getWriter());

        boardCategory.setBoard(board);
        categoryRepository.save(boardCategory);

        member.setBoard(board);
        memberRepository.save(member);

        boardRepository.save(board);
    }

    @Override
    public List<Board> everyBoardList() {
        return boardRepository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    }

    @Override
    public List<Board> specificBoardList(String categoryName) {
        BoardCategory category;

        Optional<BoardCategory> maybeCategory = categoryRepository.findByCategoryName(categoryName);
        if(maybeCategory.isPresent()) {
            category = maybeCategory.get();

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

        return maybeBoard.get();
    }

    @Override
    public void modify(Board board) {
        boardRepository.save(board);
    }

    @Override
    public void remove(Long boardNo) {
        boardRepository.deleteById(boardNo);
    }
}
