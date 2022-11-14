package kr.eddi.demo.controller.form;


import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class BoardModifyForm {

    public String category;
    public String title;
    public String contents;
}
