import 'package:flutter/material.dart';

import '../../components/app_bar/common_drawer_menu.dart';
import '../../components/app_bar/common_top_app_bar.dart';
import '../../components/ranking/team_ranking_form.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CommonTopAppBar(
          title: const Text('순위'),
          appBar: AppBar(),
        ),
        drawer: const Drawer(
          child: CommonDrawerMenu(),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: const <Widget>[TeamRankingForm()],
            ),
          ),
        ));
  }
}
