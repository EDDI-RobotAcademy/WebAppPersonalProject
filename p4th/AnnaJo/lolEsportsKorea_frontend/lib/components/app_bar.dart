import 'package:flutter/material.dart';
import 'package:flutter_login_ui/pages/match_schedule.dart';
import 'package:flutter_login_ui/pages/setting.dart';
import '../main.dart';
import '../pages/match_prediction.dart';
import '../pages/my_team.dart';
import '../pages/ranking.dart';
import 'drawer_list_tile_pages.dart';


class CommonAppBar extends StatelessWidget {
  /// 모든 화면에 공통되게 보여지는 메뉴와 설정 App Bar widget
  const CommonAppBar({Key? key, required this.titleText}) : super(key: key);

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titleText),
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                //설정 페이지 연결
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const Setting();
                    })
                );}
            ),
          ],
        ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/logo.png"),
                backgroundColor: Colors.black,
              ),
                accountName: Text('닉네임'),
                accountEmail: Text('T1@gmail.com')
            ),
            DrawerListTilePages(
                pageName: () => const MyApp(),
                pageTitle: 'Home',
                iconsName: Icons.home
            ),
            DrawerListTilePages(
              pageName: () => const MatchSchedule(),
              pageTitle: '경기 일정',
              iconsName: Icons.calendar_today
            ),
            DrawerListTilePages(
                pageName: () => const MyTeam(),
                pageTitle: 'My Team',
                iconsName: Icons.workspace_premium_rounded
            ),
            DrawerListTilePages(
                pageName: () => const Ranking(),
                pageTitle: '순위',
                iconsName: Icons.auto_graph
            ),
            DrawerListTilePages(
                pageName: () => const MatchPrediction(),
                pageTitle: '승부 예측',
                iconsName: Icons.flag_rounded
            ),
          ],
        )
      ),
    );
  }
}



