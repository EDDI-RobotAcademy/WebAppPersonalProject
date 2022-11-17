package kr.pjj.demo.service.boards.exercise;

import java.util.List;

public interface RecommendService {
    public List<Integer> recommendStatus(Long memberId, Long boardNo, String thumbType);
}
