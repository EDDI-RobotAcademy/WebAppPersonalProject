package com.example.demo.service.boards.buyBoard.baram;

import com.example.demo.entity.boards.buyBoard.baram.BuyBaramBoard;
import com.example.demo.repository.buyBoard.baram.BuyBaramRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class BuyBaramServiceImpl implements BuyBaramService{
    @Autowired
    BuyBaramRepository buyBaramRepository;

    @Override
    public List<BuyBaramBoard> buyBaramList() {
        return buyBaramRepository.findAll(Sort.by(Sort.Direction.DESC, "buyBaramNo"));
    }


}
