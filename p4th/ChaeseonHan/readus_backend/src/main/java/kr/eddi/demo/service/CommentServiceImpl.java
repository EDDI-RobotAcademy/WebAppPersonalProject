package kr.eddi.demo.service;

import kr.eddi.demo.entity.BoardComment;
import kr.eddi.demo.entity.CommunityBoard;
import kr.eddi.demo.entity.ReadUsMember;
import kr.eddi.demo.repository.CommentRepository;
import kr.eddi.demo.repository.CommunityBoardRepository;
import kr.eddi.demo.repository.MemberRepository;
import kr.eddi.demo.service.request.CommentWriteToBoardRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Optional;

@Service
@Slf4j
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommunityBoardRepository boardRepository;


    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    CommentRepository commentRepository;


    /**
     * 댓글 작성 메소드
     * 댓글을 작성할 게시글 boardNo와 회원 member_id로 찾은 정보를 댓글과 함께 관리하며
     * 해당 entity에 있는 commentList를 업데이트 한 후 저장한다.
     * @param request
     * @return 댓글 작성 성공 여부
     */
    @Override
    @Transactional
    public Boolean write(CommentWriteToBoardRequest request) {

        Optional<CommunityBoard> maybeBoard = boardRepository.findById(request.getBoardNo());
        if (maybeBoard.isEmpty()) {
            log.info("board is empty!");
            return false;
        }
        CommunityBoard board = maybeBoard.get();


        Optional<ReadUsMember> maybeMember = memberRepository.findById(request.getMember_id());
        if(maybeMember.isEmpty()) {
            log.info("member is empty!");
            return false;
        }

        ReadUsMember member = maybeMember.get();

        BoardComment boardComment = request.toBoardComment(board, member);
        boardComment.updateCommentToBoard();
        boardComment.updateCommentToMember();
        commentRepository.save(boardComment);
        return true;
    }

    @Override
    public Boolean modify() {
        return null;
    }

    @Override
    public Boolean delete() {
        return null;
    }
}
