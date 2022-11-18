package com.example.demo.league;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import static com.example.demo.entity.league.LeagueCrwalingComponentLocalMain.getLeagueInfoList;

@SpringBootTest
public class leagueCrwalingTestCase {

    @Test
    void leagueCrwalingController() {
        getLeagueInfoList();
    }

    @Test
    void crwalingTest() {

        try {
            Document doc = Jsoup.connect(
                            "https://game.naver.com/esports/League_of_Legends/schedule/world_championship?date=2022-10")
                    .get();
            System.out.println("eSports Document 확인 OK");

            Elements arr = doc.select(".card_item__3Covz");

            for (Element e : arr) {
                System.out.println("리그 타이틀 : " + e.text());
            }
        } catch (Exception e) {
            e.getStackTrace();
        }

        try {
            Document doc = Jsoup.connect(
                            "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%82%A0%EC%94%A8&oquery=%EB%82%A0%EC%94%A8&tqi=h2CqrwprvhGssiQwv1RssssstOV-088003")
                    .get();
            System.out.println("날씨 Document 확인 OK");

            Elements arr = doc.select(".temperature_text");

            for (Element e : arr) {
                System.out.println("온도 : " + e.text());
            }
        } catch (Exception e) {
            e.getStackTrace();
        }

    }
}
