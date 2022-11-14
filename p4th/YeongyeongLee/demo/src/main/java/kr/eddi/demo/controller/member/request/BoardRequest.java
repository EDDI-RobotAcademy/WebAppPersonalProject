package kr.eddi.demo.controller.member.request;


import lombok.Getter;

@Getter
public class BoardRequest {
    private String title;
    private String writer;
    private String content;

}