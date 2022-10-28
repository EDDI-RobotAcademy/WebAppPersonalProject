import 'package:flutter/material.dart';
import 'package:lol_esports_korea_app/components/app_bar/common_top_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonTopAppBar(
        title: const Text('Home'),
        appBar: AppBar(),
      ),
    );
  }
}
