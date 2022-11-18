package kr.eddi.demo.controller.form;


import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class BoardModifyForm {

    private String category;
    private String title;
    private String contents;
}
