import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lol_esports_korea_app/pages/main_menu/match_prediction_page.dart';
import 'package:lol_esports_korea_app/pages/main_menu/match_schedule_page.dart';
import 'package:lol_esports_korea_app/pages/main_menu/my_team_page.dart';
import 'package:lol_esports_korea_app/pages/main_menu/rankin_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomBar> {
  ///맨 처음에 나오는 화면
  int _selectedIndex = 0;

  ///이동할 페이지 List
  static const List _pages = [
    MatchSchedulePage(),
    MyTeamPage(),
    RankingPage(),
    MatchPredictionPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _pages[_selectedIndex], //페이지와 연결
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                backgroundColor: Colors.black,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.deepPurple,
                gap: 8,
                iconSize: 25,
                padding: const EdgeInsets.all(16),
                tabs: const [
                  GButton(icon: Icons.calendar_today, text: '경기 일정'),
                  GButton(
                      icon: Icons.workspace_premium_rounded, text: 'My Team'),
                  GButton(icon: Icons.auto_graph, text: '순위'),
                  GButton(icon: Icons.flag_rounded, text: '승부 예측'),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
