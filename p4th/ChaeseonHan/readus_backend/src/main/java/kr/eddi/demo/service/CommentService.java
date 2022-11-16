package kr.eddi.demo.service;


import kr.eddi.demo.service.request.CommentWriteToBoardRequest;

public interface CommentService {

    Boolean write(CommentWriteToBoardRequest request);

    Boolean modify(Long commentNo, String modifiedComment);

    Boolean delete();
}
