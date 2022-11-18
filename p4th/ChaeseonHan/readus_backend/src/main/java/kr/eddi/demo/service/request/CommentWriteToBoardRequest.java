package kr.eddi.demo.service.request;

import kr.eddi.demo.entity.BoardComment;
import kr.eddi.demo.entity.CommunityBoard;
import kr.eddi.demo.entity.ReadUsMember;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public class CommentWriteToBoardRequest {

    private final Long boardNo;
    private final Long member_id;
    private final String comment;

    public BoardComment toBoardComment(CommunityBoard board, ReadUsMember member) {
        return new BoardComment(this.comment, board, member);
    }
}
