package kr.eddi.demo.controller.form;


import kr.eddi.demo.service.request.BoardWriteRequest;
import lombok.Data;

@Data
public class BoardWriteForm {

    public String category;
    public String title;
    public String content;

    public String memberEmail;

    public BoardWriteRequest toBoardWriteRequest() {
        return new BoardWriteRequest(this.category, this.title, this.content, this.memberEmail);
    }


}
