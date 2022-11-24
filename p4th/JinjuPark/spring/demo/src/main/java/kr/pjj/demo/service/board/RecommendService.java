package kr.pjj.demo.service.board;

import java.util.List;

public interface RecommendService {
    public List<Integer> recommendStatus(Long memberId, Long boardNo, String thumbType);
}
