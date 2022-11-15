import 'package:flutter/material.dart';
import 'package:lol_esports_korea_app/pages/home_page.dart';

import '../../pages/match_prediction_page.dart';
import '../../pages/match_schedule_page.dart';
import '../../pages/my_team_page.dart';
import '../../pages/rankin_page.dart';
import 'drawer_list_tile.dart';

/// 상단 앱바에서 메뉴 아이콘을 클릭했을시 왼쪽에 나타나는 Drawer Menu
class CommonDrawerMenu extends StatelessWidget {
  const CommonDrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo.png"),
              backgroundColor: Colors.black,
            ),
            accountName: Text('닉네임'),
            accountEmail: Text('T1@gmail.com'),
        ),
        DrawerListTile(
            pageName: () => const HomePage(),
            pageTitle: 'Home',
            iconsName: Icons.home
        ),
        DrawerListTile(
            pageName: () => const MatchSchedulePage(),
            pageTitle: '경기 일정',
            iconsName: Icons.calendar_today
        ),
        DrawerListTile(
            pageName: () => const MyTeamPage(),
            pageTitle: 'My Team',
            iconsName: Icons.workspace_premium_rounded
        ),
        DrawerListTile(
            pageName: () => const RankingPage(),
            pageTitle: '순위',
            iconsName: Icons.auto_graph
        ),
        DrawerListTile(
            pageName: () => const MatchPredictionPage(),
            pageTitle: '승부 예측',
            iconsName: Icons.flag_rounded
        ),
      ],
    );
  }
}
