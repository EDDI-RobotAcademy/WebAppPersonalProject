package com.example.look_lend_backend.service.board;

import com.example.look_lend_backend.entity.board.ReviewBoard;
import com.example.look_lend_backend.repository.board.ReviewBoardRepository;
import com.example.look_lend_backend.service.board.request.ReviewBoardRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class ReviewBoardServiceImpl implements ReviewBoardService{

    @Autowired
    ReviewBoardRepository repository;

    @Override
    public void register(ReviewBoardRequest reviewBoardRequest) {
        ReviewBoard reviewBoard = new ReviewBoard();
        reviewBoard.setType(reviewBoardRequest.getType());
        reviewBoard.setTitle(reviewBoardRequest.getTitle());
        reviewBoard.setContent(reviewBoardRequest.getContent());
        reviewBoard.setWriter(reviewBoardRequest.getWriter());

        repository.save(reviewBoard);
    }

    @Override
    public List<ReviewBoard> list() {
        return repository.findAll(Sort.by(Sort.Direction.DESC,"reviewNo"));
    }

    @Override
    public ReviewBoard read(Long reviewNo) {
        Optional<ReviewBoard> maybeReviewBoard = repository.findById(reviewNo);

        if(maybeReviewBoard.equals(Optional.empty())) {
            log.info("Can't read communityBoard info!!!");
            return null;
        }

        return maybeReviewBoard.get();
    }

    @Override
    public void modify(ReviewBoard reviewBoard) {
        repository.save(reviewBoard);
    }

    @Override
    public void remove(Long reviewNo) {
        repository.deleteById(reviewNo);
    }
}

