package kr.pjj.demo.controller.member.boards.exercise.request;

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
