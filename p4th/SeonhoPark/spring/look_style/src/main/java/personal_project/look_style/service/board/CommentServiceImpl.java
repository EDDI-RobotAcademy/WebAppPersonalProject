package personal_project.look_style.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import personal_project.look_style.entity.board.Board;
import personal_project.look_style.entity.board.Comment;
import personal_project.look_style.repository.board.BoardRepository;
import personal_project.look_style.repository.board.CommentRepository;
import personal_project.look_style.service.board.request.CommentRequest;

import java.util.List;
import java.util.Optional;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentRepository commentRepository;

    @Autowired
    BoardRepository boardRepository;
    @Override
    public void registerComment(CommentRequest request) {
        Optional<Board> maybeBoard = boardRepository.findById(request.getBoardNo());
        Board board = maybeBoard.get();
        Comment comment = new Comment();
        comment.setWriter(request.getWriter());
        comment.setContent(request.getContent());
        comment.setBoard(board);
        commentRepository.save(comment);
    }

    @Override
    public List<Comment> findCommentsOnSpecificBoard(Long boardNo) {
        List<Comment> comments = commentRepository.findAllCommentsByBoardNo(boardNo);
        return comments;
    }

    @Override
    public void modifyCommentOnBoard(Comment comment, Long boardNo) {
        Optional<Board> maybeBoard = boardRepository.findById(boardNo);
        Board board = maybeBoard.get();
        comment.setBoard(board);
        commentRepository.save(comment);
    }

    @Override
    public void deleteCommentOnBoard(Long commentId) {
        commentRepository.deleteById(commentId);
    }
}
