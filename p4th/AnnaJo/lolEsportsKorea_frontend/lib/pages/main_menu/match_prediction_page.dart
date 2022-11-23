import 'package:flutter/material.dart';

import '../../components/app_bar/common_drawer_menu.dart';
import '../../components/app_bar/common_top_app_bar.dart';

class MatchPredictionPage extends StatelessWidget {
  const MatchPredictionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonTopAppBar(
        title: const Text('승부 예측'),
        appBar: AppBar(),
      ),
      drawer: Drawer(
        child: CommonDrawerMenu(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Center(
                child: Text('Comming Soon..',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
          ],
      )
    );
  }
}
