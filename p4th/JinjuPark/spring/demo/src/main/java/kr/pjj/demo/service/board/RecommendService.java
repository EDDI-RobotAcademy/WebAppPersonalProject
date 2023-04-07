package kr.pjj.demo.service.board;

import java.util.List;

public interface RecommendService {
    public List<Integer> recommendStatus(Long boardNo);
    public List<Integer> recommendUpDown(Long memberId, Long boardNo, String thumbType);
}
