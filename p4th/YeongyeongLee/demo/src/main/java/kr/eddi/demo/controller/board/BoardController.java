package kr.eddi.demo.controller.board;

import kr.eddi.demo.controller.board.request.BoardRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;





@Slf4j
@RestController
@RequestMapping("board")
@CrossOrigin(origins = "http://localhost:8081", allowedHeaders = "*")


public class BoardController {


    @GetMapping("/list")

    public void boardRegister (@RequestBody BoardRequest boardRequest) {
        log.info("boardRegister()");

    }

}
