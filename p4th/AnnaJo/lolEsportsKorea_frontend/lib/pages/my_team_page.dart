import 'package:flutter/material.dart';

import '../components/app_bar/common_drawer_menu.dart';
import '../components/app_bar/common_top_app_bar.dart';

class MyTeamPage extends StatelessWidget {
  const MyTeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonTopAppBar(
        title: const Text('My Team'),
        appBar: AppBar(),
      ),
      drawer: const Drawer(
        child: CommonDrawerMenu(),
      ),
      body: Center(
        child: Column(
          children: const <Widget>[
            Text('My Team'),
          ],
        ),
      ),
    );
  }
}
