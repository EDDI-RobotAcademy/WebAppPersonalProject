package kr.pjj.demo.service.boards.exercise;

import kr.pjj.demo.entity.boards.exercise.Diary;
import kr.pjj.demo.repository.boards.exercise.DiaryRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class DiaryServiceImpl implements DiaryService{

    @Autowired
    DiaryRepository repository;

    @Override
    public List<Diary> list() {
        return repository.findAll(Sort.by(Sort.Direction.DESC, "boardNo"));
    }

    @Override
    public List<Diary> search(String keyword) {
        return repository.findByTitleOrWriterOrContent(keyword, keyword, keyword);
    }

}
