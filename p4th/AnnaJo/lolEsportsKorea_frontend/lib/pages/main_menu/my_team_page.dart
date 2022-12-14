import 'package:flutter/material.dart';
import 'package:lol_esports_korea_app/pages/main_menu/teams_info_page/drx_page.dart';
import 'package:lol_esports_korea_app/pages/main_menu/teams_info_page/t1_page.dart';

import '../../components/app_bar/common_drawer_menu.dart';
import '../../components/app_bar/common_top_app_bar.dart';
import '../../components/my_team/my_team_button_widget.dart';

class MyTeamPage extends StatelessWidget {
  const MyTeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonTopAppBar(
        title: const Text('My Team'),
        appBar: AppBar(),
      ),
      drawer: Drawer(
        child: CommonDrawerMenu(),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            children: [
              MyTeamButtonWidget(
                  logoName: 'T1',
                  teamName: 'T1',
                  onCustomButtonPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const T1Page()));
                  }),
              MyTeamButtonWidget(
                  logoName: 'DRX',
                  teamName: 'DRX',
                  onCustomButtonPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DrxPage()));
                  }),
            ],
          ),
          Row(
            children: [
              MyTeamButtonWidget(
                  logoName: 'GEN',
                  teamName: '젠지',
                  onCustomButtonPressed: () {
                    null;
                  }),
              MyTeamButtonWidget(
                  logoName: 'DK',
                  teamName: '담원 기아',
                  onCustomButtonPressed: () {
                    null;
                  }),
            ],
          ),
          Row(
            children: [
              MyTeamButtonWidget(
                  logoName: 'NS',
                  teamName: '농심',
                  onCustomButtonPressed: () {
                    null;
                  }),
              MyTeamButtonWidget(
                  logoName: 'LSB',
                  teamName: '리브 샌박',
                  onCustomButtonPressed: () {
                    null;
                  }),
            ],
          ),
          Row(
            children: [
              MyTeamButtonWidget(
                  logoName: 'KT',
                  teamName: 'KT',
                  onCustomButtonPressed: () {
                    null;
                  }),
              MyTeamButtonWidget(
                  logoName: 'KDF',
                  teamName: '광동',
                  onCustomButtonPressed: () {
                    null;
                  }),
            ],
          ),
          Row(
            children: [
              MyTeamButtonWidget(
                  logoName: 'BRO',
                  teamName: '프레딧',
                  onCustomButtonPressed: () {
                    null;
                  }),
              MyTeamButtonWidget(
                  logoName: 'HLE',
                  teamName: '한화생명',
                  onCustomButtonPressed: () {
                    null;
                  }),
            ],
          ),
        ],
      )),
    );
  }
}
