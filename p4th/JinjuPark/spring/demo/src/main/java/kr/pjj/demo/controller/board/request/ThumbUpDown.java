package kr.pjj.demo.controller.board.request;

import lombok.Getter;

@Getter
public class ThumbUpDown {
    private Long memberId;
    private Long boardNo;
    private String thumbType;

    //thumbNumCheck,
    // thumbUp,
    // thumbUpCancel,
    // thumbDown,
    // thumbDownCancel
}
