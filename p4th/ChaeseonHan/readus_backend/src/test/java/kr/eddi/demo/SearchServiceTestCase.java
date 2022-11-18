package kr.eddi.demo;

import kr.eddi.demo.entity.CommunityBoard;
import kr.eddi.demo.service.SearchServiceImpl;
import org.json.JSONArray;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class SearchServiceTestCase {

    @Autowired
    SearchServiceImpl service;

    @Test
    void searchBoardAtTitleAndContents() {
        List<CommunityBoard> searchList = service.searchBoardWithTitleAndContents("신간");
        for (int i = 0; i < searchList.size(); i++) {
            System.out.println(searchList.get(i).toString());
        }
    }
}

