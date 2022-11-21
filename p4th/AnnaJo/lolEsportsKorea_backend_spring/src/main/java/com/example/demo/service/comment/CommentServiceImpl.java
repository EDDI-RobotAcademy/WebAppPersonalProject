package com.example.demo.service.comment;

import com.example.demo.controller.comment.request.CommentRequest;
import com.example.demo.entity.comment.Comment;
import com.example.demo.repository.comment.CommentListRepository;
import com.example.demo.repository.comment.CommentRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class CommentServiceImpl implements CommentService{

    @Autowired
    CommentRepository repository;

    @Autowired
    CommentListRepository listRepository;

    @Override
    public void register(CommentRequest commentRequest) {
        Comment comment = new Comment();
        comment.setMyTeam(commentRequest.getMyTeam());
        comment.setNickName(commentRequest.getNickName());
        comment.setContents(commentRequest.getContents());
        comment.setTeamProfile(commentRequest.getTeamProfile());
        comment.setDate(commentRequest.getDate());

        repository.save(comment);
    }

    @Override
    public List<Comment> getTeamCommentList(String requestRanking) {
        return listRepository.findCommentByContentsContaining(requestRanking);
    }
}
