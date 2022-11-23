package com.example.backend.service.board;

import com.example.backend.entity.board.Board;
import com.example.backend.entity.board.BoardCategory;
import com.example.backend.entity.member.Member;
import com.example.backend.repository.BoardCategoryRepository;
import com.example.backend.repository.BoardRepository;
import com.example.backend.repository.MemberRepository;
import com.example.backend.service.board.request.BoardModifyRequest;
import com.example.backend.service.board.request.BoardRegisterRequest;
import com.example.backend.service.board.response.BoardResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
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
    public boolean register(BoardRegisterRequest boardRegisterRequest) {
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

        return true;
    }

    @Override
    public List<BoardResponse> everyBoardList() {
        List<BoardResponse> responses = new ArrayList<>();
        List<Board> boards = boardRepository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
        for(Board b : boards) {
            BoardResponse target = new BoardResponse(
                                            b.getBoardNo(),
                                            b.getTitle(),
                                            b.getWriter(),
                                            b.getContent(),
                                            b.getBoardCategory().getCategoryName(),
                                            b.getRegDate() );
            responses.add(target);
        }
        // System.out.println("board list: " + boardRepository.findAll(Sort.by(Sort.Direction.DESC, "boardNo")));
        return responses;
    }

    @Override
    public List<BoardResponse> specificBoardList(String categoryName) {
        BoardCategory boardCategory;
        List<BoardResponse> responses = new ArrayList<>();
        List<Board> boards = new ArrayList<>();

        Optional<BoardCategory> maybeCategory = categoryRepository.findByCategoryName(categoryName);
        if(maybeCategory.isPresent()) {
            boardCategory = maybeCategory.get();
            // System.out.println(boardRepository.findAllBoardsByCategoryId(category.getCategoryId()));
            boards = boardRepository.findAllBoardsByCategoryId(boardCategory.getCategoryId(), Sort.by(Sort.Direction.DESC, "boardNo"));

            for(Board b : boards) {
                BoardResponse target = new BoardResponse(
                                            b.getBoardNo(),
                                            b.getTitle(),
                                            b.getWriter(),
                                            b.getContent(),
                                            b.getBoardCategory().getCategoryName(),
                                            b.getRegDate() );
                responses.add(target);
            }
            return responses;
        } else {
            throw new RuntimeException("존재하지 않는 게시판");
        }
    }

    @Override
    public BoardResponse read(Long boardNo) {
        Optional<Board> maybeBoard = boardRepository.findById(boardNo);

        if (maybeBoard.equals(Optional.empty())) {
            log.info("Can't read board!!!");

            return null;
        }
        Board board = maybeBoard.get();
        BoardResponse responseBoard = new BoardResponse(
                                            board.getBoardNo(),
                                            board.getTitle(),
                                            board.getWriter(),
                                            board.getContent(),
                                            board.getBoardCategory().getCategoryName(),
                                            board.getRegDate() );

        // log.info(String.valueOf(maybeBoard.get()));
        return responseBoard;
    }

    @Override
    public BoardResponse modify(Long boardNo, BoardModifyRequest boardModifyRequest) {
        Board modifyBoard;
        BoardResponse modifyBoardResponse;

        Optional<Board> maybeBoard = boardRepository.findById(boardNo);
        if(maybeBoard.isPresent()) {
            modifyBoard = maybeBoard.get();
            modifyBoard.setTitle(boardModifyRequest.getTitle());
            modifyBoard.setContent(boardModifyRequest.getContent());
            boardRepository.save(modifyBoard);

            modifyBoardResponse = new BoardResponse(
                                        modifyBoard.getBoardNo(),
                                        modifyBoard.getTitle(),
                                        modifyBoard.getWriter(),
                                        modifyBoard.getContent(),
                                        modifyBoard.getBoardCategory().getCategoryName(),
                                        modifyBoard.getRegDate());

            return modifyBoardResponse;
        } else {
            throw new RuntimeException("존재하지 않는 게시물!");
        }
    }

    @Override
    public void remove(Long boardNo) {
        boardRepository.deleteById(boardNo);
    }

}
