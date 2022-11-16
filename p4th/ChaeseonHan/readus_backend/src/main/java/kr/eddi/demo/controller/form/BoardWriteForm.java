package kr.eddi.demo.controller.form;


import kr.eddi.demo.service.request.BoardWriteRequest;
import lombok.Data;

@Data
public class BoardWriteForm {

    private String category;
    private String title;
    private String contents;

    private String memberEmail;

    public BoardWriteRequest toBoardWriteRequest() {
        return new BoardWriteRequest(this.category, this.title, this.contents, this.memberEmail);
    }


}
